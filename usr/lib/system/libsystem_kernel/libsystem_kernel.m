#error "1801C8578: call analysis failed (funcsize=152)"
uint64_t mach_absolute_time(void)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t StatusReg;
  uint64_t v5;
  unint64_t v6;
  if (!MEMORY[0xFFFFFC090]) {
    return mach_absolute_time_kernel();
  }
  if (MEMORY[0xFFFFFC090] == 2LL)
  {
    do
    {
      v3 = MEMORY[0xFFFFFC088];
      StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 14, 0, 6));
    }

    while (v3 != MEMORY[0xFFFFFC088]);
    return StatusReg + v3;
  }

  else if (MEMORY[0xFFFFFC090] == 3LL)
  {
    do
    {
      v5 = MEMORY[0xFFFFFC088];
      v6 = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 10, 6));
    }

    while (v5 != MEMORY[0xFFFFFC088]);
    return v6 + v5;
  }

  else
  {
    __isb(0xFu);
    do
    {
      v1 = MEMORY[0xFFFFFC088];
      v2 = _ReadStatusReg(ARM64_SYSREG(3, 3, 14, 0, 2));
    }

    while (v1 != MEMORY[0xFFFFFC088]);
    return v2 + v1;
  }
}

uint64_t mach_absolute_time_kernel()
{
  return mac_syscall(MACH_ABSOLUTE_TIME_TRAP);
}

int64_t mach_continuous_time_kernel( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(-4, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t _kernelrpc_mach_vm_allocate_trap( mach_port_name_t target, mach_vm_offset_t *addr, mach_vm_size_t size, int flags)
{
  return mac_syscall(KERNELRPC_MACH_VM_ALLOCATE_TRAP, target, addr, size, flags);
}

kern_return_t _kernelrpc_mach_vm_purgable_control_trap( mach_port_name_t target, mach_vm_offset_t address, vm_purgable_t control, int *state)
{
  return mac_syscall(-11, *(void **)&target, (void *)address, *(void **)&control, state, v4, v5, v6, v7);
}

kern_return_t _kernelrpc_mach_vm_deallocate_trap( mach_port_name_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return mac_syscall(KERNELRPC_MACH_VM_DEALLOCATE_TRAP, target, address, size);
}

kern_return_t task_dyld_process_info_notify_get(mach_port_name_array_t names_addr, natural_t *names_count_addr)
{
  return mac_syscall(-13, names_addr, names_count_addr, v2, v3, v4, v5, v6, v7);
}

kern_return_t _kernelrpc_mach_vm_protect_trap( mach_port_name_t target, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return mac_syscall(KERNELRPC_MACH_VM_PROTECT_TRAP, target, address, size, set_maximum, new_protection);
}

kern_return_t _kernelrpc_mach_vm_map_trap( mach_port_name_t target, mach_vm_offset_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_prot_t cur_protection)
{
  return mac_syscall(KERNELRPC_MACH_VM_MAP_TRAP, target, address, size, (mach_vm_offset_t *)mask, flags, cur_protection);
}

kern_return_t _kernelrpc_mach_port_allocate_trap( mach_port_name_t target, mach_port_right_t right, mach_port_name_t *name)
{
  return mac_syscall(KERNELRPC_MACH_PORT_ALLOCATE_TRAP, target, right, name);
}

kern_return_t _kernelrpc_mach_port_deallocate_trap(mach_port_name_t target, mach_port_name_t name)
{
  return mac_syscall(KERNELRPC_MACH_PORT_DEALLOCATE_TRAP, target, name);
}

kern_return_t _kernelrpc_mach_port_mod_refs_trap( mach_port_name_t target, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return mac_syscall(KERNELRPC_MACH_PORT_MOD_REFS_TRAP, target, name, right, delta);
}

kern_return_t _kernelrpc_mach_port_move_member_trap( mach_port_name_t target, mach_port_name_t member, mach_port_name_t after)
{
  return mac_syscall(KERNELRPC_MACH_PORT_MOVE_MEMBER_TRAP, target, member, after);
}

kern_return_t _kernelrpc_mach_port_insert_right_trap( mach_port_name_t target, mach_port_name_t name, mach_port_name_t poly, mach_msg_type_name_t polyPoly)
{
  return mac_syscall(KERNELRPC_MACH_PORT_INSERT_RIGHT_TRAP, target, name, poly, polyPoly);
}

kern_return_t _kernelrpc_mach_port_insert_member_trap( mach_port_name_t target, mach_port_name_t name, mach_port_name_t pset)
{
  return mac_syscall(KERNELRPC_MACH_PORT_INSERT_MEMBER_TRAP, target, name, pset);
}

kern_return_t _kernelrpc_mach_port_extract_member_trap( mach_port_name_t target, mach_port_name_t name, mach_port_name_t pset)
{
  return mac_syscall(KERNELRPC_MACH_PORT_EXTRACT_MEMBER_TRAP, target, name, pset);
}

kern_return_t _kernelrpc_mach_port_construct_trap( mach_port_name_t target, mach_port_options_t *options, uint64_t context, mach_port_name_t *name)
{
  return mac_syscall(KERNELRPC_MACH_PORT_CONSTRUCT_TRAP, target, options, context, name);
}

kern_return_t _kernelrpc_mach_port_destruct_trap( mach_port_name_t target, mach_port_name_t name, mach_port_delta_t srdelta, uint64_t guard)
{
  return mac_syscall(KERNELRPC_MACH_PORT_DESTRUCT_TRAP, target, name, srdelta, guard);
}

mach_port_name_t mach_reply_port()
{
  return mac_syscall(MACH_REPLY_PORT_TRAP);
}

mach_port_name_t thread_self_trap()
{
  return mac_syscall(THREAD_SELF_TRAP);
}

mach_port_name_t task_self_trap(void)
{
  return mac_syscall(TASK_SELF_TRAP);
}

mach_port_name_t host_self_trap()
{
  return mac_syscall(HOST_SELF_TRAP);
}

mach_msg_return_t mach_msg_trap( mach_msg_header_t *a1, mach_msg_option_t a2, mach_msg_size_t a3, mach_msg_size_t a4, mach_port_name_t a5, mach_msg_timeout_t a6, mach_port_name_t a7)
{
  return mac_syscall(MACH_MSG_TRAP, a1, a2, a3, a4, a5, a6, a7);
}

mach_msg_return_t mach_msg_overwrite_trap( mach_msg_header_t *a1, mach_msg_option_t a2, mach_msg_size_t a3, mach_msg_size_t a4, mach_port_name_t a5, mach_msg_timeout_t a6, mach_port_name_t a7, mach_msg_header_t *a8)
{
  return mac_syscall(MACH_MSG_OVERWRITE_TRAP, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t semaphore_signal_trap(mach_port_name_t a1)
{
  return mac_syscall(SEMAPHORE_SIGNAL_TRAP, a1);
}

kern_return_t semaphore_signal_all_trap(mach_port_name_t a1)
{
  return mac_syscall(SEMAPHORE_SIGNAL_ALL_TRAP, a1);
}

kern_return_t semaphore_signal_thread_trap(mach_port_name_t a1, mach_port_name_t a2)
{
  return mac_syscall(SEMAPHORE_SIGNAL_THREAD_TRAP, a1, a2);
}

kern_return_t semaphore_wait_trap(mach_port_name_t a1)
{
  return mac_syscall(SEMAPHORE_WAIT_TRAP, a1);
}

kern_return_t semaphore_wait_signal_trap(mach_port_name_t a1, mach_port_name_t a2)
{
  return mac_syscall(SEMAPHORE_WAIT_SIGNAL_TRAP, a1, a2);
}

kern_return_t semaphore_timedwait_trap(mach_port_name_t a1, unsigned int a2, clock_res_t a3)
{
  return mac_syscall(SEMAPHORE_TIMEDWAIT_TRAP, a1, a2, a3);
}

kern_return_t semaphore_timedwait_signal_trap( mach_port_name_t a1, mach_port_name_t a2, unsigned int a3, clock_res_t a4)
{
  return mac_syscall(SEMAPHORE_TIMEDWAIT_SIGNAL_TRAP, a1, a2, a3, a4);
}

kern_return_t _kernelrpc_mach_port_get_attributes_trap( mach_port_name_t target, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return mac_syscall( -40,  *(void **)&target,  *(void **)&name,  *(void **)&flavor,  port_info_out,  port_info_outCnt,  v5,  v6,  v7);
}

kern_return_t _kernelrpc_mach_port_guard_trap( mach_port_name_t target, mach_port_name_t name, uint64_t guard, BOOLean_t strict)
{
  return mac_syscall(KERNELRPC_MACH_PORT_GUARD_TRAP, target, name, guard, strict);
}

kern_return_t _kernelrpc_mach_port_unguard_trap(mach_port_name_t target, mach_port_name_t name, uint64_t guard)
{
  return mac_syscall(KERNELRPC_MACH_PORT_UNGUARD_TRAP, target, name, guard);
}

kern_return_t mach_generate_activity_id(mach_port_name_t target, int count, uint64_t *activity_id)
{
  return mac_syscall(MAP_FD_TRAP, target, *(vm_offset_t *)&count, activity_id, v3, v4);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return mac_syscall(TASK_NAME_FOR_PID_TRAP, target_tport, pid, tn);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return mac_syscall(TASK_FOR_PID_TRAP, target_tport, pid, t);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return mac_syscall(PID_FOR_TASK_TRAP, t, x);
}

int64_t mach_msg2_trap( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(-47, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t macx_swapon(uint64_t filename, int flags, int size, int priority)
{
  return mac_syscall(MACX_SWAPON_TRAP, filename, flags, size, priority);
}

kern_return_t macx_swapoff(uint64_t filename, int flags)
{
  return mac_syscall(MACX_SWAPOFF_TRAP, filename, flags);
}

int64_t thread_get_special_reply_port( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(-50, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t macx_triggers(int hi_water, int low_water, int flags, mach_port_t alert_port)
{
  return mac_syscall(MACX_TRIGGERS_TRAP, hi_water, low_water, flags, alert_port);
}

kern_return_t macx_backing_store_suspend(BOOLean_t suspend)
{
  return mac_syscall(MACX_BACKING_STORE_SUSPEND_TRAP, suspend);
}

kern_return_t macx_backing_store_recovery(int pid)
{
  return mac_syscall(MACX_BACKING_STORE_RECOVERY_TRAP, pid);
}

BOOLean_t swtch_pri(int pri)
{
  return mac_syscall(SWTCH_PRI_TRAP, pri);
}

BOOLean_t swtch(void)
{
  return mac_syscall(SWTCH_TRAP);
}

kern_return_t syscall_thread_switch(mach_port_name_t a1, int a2, mach_msg_timeout_t a3)
{
  return mac_syscall(THREAD_SWITCH_TRAP, a1, a2, a3);
}

kern_return_t clock_sleep_trap( mach_port_name_t clock_name, sleep_type_t sleep_type, int sleep_sec, int sleep_nsec, mach_timespec_t *wakeup_time)
{
  return mac_syscall(CLOCK_SLEEP_TRAP, clock_name, sleep_type, sleep_sec, sleep_nsec, (mach_timespec_t)wakeup_time);
}

kern_return_t host_create_mach_voucher_trap( mach_port_name_t host, mach_voucher_attr_raw_recipe_array_t recipes, int recipes_size, mach_port_name_t *voucher)
{
  return mac_syscall(-70, *(void **)&host, recipes, *(void **)&recipes_size, voucher, v4, v5, v6, v7);
}

kern_return_t mach_voucher_extract_attr_recipe_trap( mach_port_name_t voucher_name, mach_voucher_attr_key_t key, mach_voucher_attr_raw_recipe_t recipe, mach_msg_type_number_t *recipe_size)
{
  return mac_syscall(-72, *(void **)&voucher_name, *(void **)&key, recipe, recipe_size, v4, v5, v6, v7);
}

kern_return_t _kernelrpc_mach_port_type_trap(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return mac_syscall(-76, *(void **)&task, *(void **)&name, ptype, v3, v4, v5, v6, v7);
}

kern_return_t _kernelrpc_mach_port_request_notification_trap( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_name_t notify, mach_msg_type_name_t notifyPoly, mach_port_name_t *previous)
{
  return mac_syscall( -77,  *(void **)&task,  *(void **)&name,  *(void **)&msgid,  *(void **)&sync,  *(void **)&notify,  *(void **)&notifyPoly,  previous,  v7);
}

int64_t _exclaves_ctl_trap( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(-88, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t mach_timebase_info_trap(mach_timebase_info *a1)
{
  return mac_syscall(MACH_TIMEBASE_INFO_TRAP, a1);
}

kern_return_t mach_wait_until(uint64_t deadline)
{
  return mac_syscall(MACH_WAIT_UNTIL_TRAP, deadline);
}

mach_port_name_t mk_timer_create()
{
  return mac_syscall(MK_TIMER_CREATE_TRAP);
}

kern_return_t mk_timer_destroy(mach_port_name_t a1)
{
  return mac_syscall(MK_TIMER_DESTROY_TRAP, a1);
}

kern_return_t mk_timer_arm(mach_port_name_t a1, uint64_t a2)
{
  return mac_syscall(MK_TIMER_ARM_TRAP, a1, a2);
}

kern_return_t mk_timer_cancel(mach_port_name_t a1, uint64_t a2)
{
  return mac_syscall(MK_TIMER_CANCEL_TRAP, a1, a2);
}

int64_t mk_timer_arm_leeway( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(-95, a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t debug_control_port_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return mac_syscall(-96, *(void **)&target_tport, *(void **)&pid, t, v3, v4, v5, v6, v7);
}

unint64_t os_cpu_copy_in_cksum( uint32x4_t *a1, uint32x4_t *a2, uint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6, __n128 a7, uint64x2_t a8)
{
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  if (a3)
  {
    if ((a1 & 1) == 0
      || (uint64_t v10 = a1->u8[0],
          a1 = (uint32x4_t *)((char *)a1 + 1),
          a2->i8[0] = v10,
          a2 = (uint32x4_t *)((char *)a2 + 1),
          unint64_t v8 = v10 << 8,
          --a3,
          uint64_t v9 = 1LL,
          a3))
    {
      int64x2_t v12 = (int64x2_t)veorq_s8(a5, a5);
      int64x2_t v11 = (int64x2_t)veorq_s8(a6, a6);
      v12.i64[0] = v8;
      if (a3 >= 128)
      {
        uint32x4_t v13 = *a1;
        a1 += 8;
        uint32x4_t v14 = v13;
        uint64x2_t v15 = (uint64x2_t)veorq_s8((int8x16_t)a7, (int8x16_t)a7);
        uint32x4_t v16 = a1[-7];
        uint64x2_t v17 = (uint64x2_t)veorq_s8((int8x16_t)a8, (int8x16_t)a8);
        uint32x4_t v18 = a1[-6];
        uint32x4_t v19 = a1[-5];
        uint32x4_t v20 = a1[-4];
        uint32x4_t v21 = a1[-3];
        uint32x4_t v22 = a1[-2];
        uint32x4_t v23 = a1[-1];
        BOOL v24 = a3 < 256;
        for (uint64_t i = a3 - 256; !v24; i -= 128LL)
        {
          *a2 = v14;
          a2 += 8;
          uint64x2_t v26 = vpadalq_u32((uint64x2_t)v12, v14);
          a2[-7] = v16;
          uint64x2_t v27 = vpadalq_u32((uint64x2_t)v11, v16);
          uint32x4_t v28 = *a1;
          a1 += 8;
          uint32x4_t v14 = v28;
          uint32x4_t v16 = a1[-7];
          a2[-6] = v18;
          uint64x2_t v29 = vpadalq_u32(v15, v18);
          a2[-5] = v19;
          uint64x2_t v30 = vpadalq_u32(v17, v19);
          uint32x4_t v18 = a1[-6];
          uint32x4_t v19 = a1[-5];
          a2[-4] = v20;
          int64x2_t v12 = (int64x2_t)vpadalq_u32(v26, v20);
          a2[-3] = v21;
          int64x2_t v11 = (int64x2_t)vpadalq_u32(v27, v21);
          uint32x4_t v20 = a1[-4];
          uint32x4_t v21 = a1[-3];
          a2[-2] = v22;
          uint64x2_t v15 = vpadalq_u32(v29, v22);
          a2[-1] = v23;
          uint64x2_t v17 = vpadalq_u32(v30, v23);
          uint32x4_t v22 = a1[-2];
          uint32x4_t v23 = a1[-1];
          BOOL v24 = i < 128;
        }

        *a2 = v14;
        a2 += 8;
        a2[-7] = v16;
        a2[-6] = v18;
        a2[-5] = v19;
        a2[-4] = v20;
        a2[-3] = v21;
        a2[-2] = v22;
        a7 = (__n128)vpadalq_u32(vpadalq_u32(v15, v18), v22);
        a2[-1] = v23;
        a8 = vpadalq_u32(vpadalq_u32(v17, v19), v23);
        a3 = i + 128;
        int64x2_t v12 = vaddq_s64((int64x2_t)vpadalq_u32(vpadalq_u32((uint64x2_t)v12, v14), v20), (int64x2_t)a7);
        int64x2_t v11 = vaddq_s64((int64x2_t)vpadalq_u32(vpadalq_u32((uint64x2_t)v11, v16), v21), (int64x2_t)a8);
      }

      if (a3 >= 64)
      {
        uint32x4_t v31 = *a1;
        a1 += 4;
        uint32x4_t v32 = a1[-3];
        *a2 = v31;
        a2 += 4;
        a2[-3] = v32;
        uint64x2_t v33 = vpadalq_u32((uint64x2_t)v11, v32);
        a7 = (__n128)a1[-2];
        a8 = (uint64x2_t)a1[-1];
        a2[-2] = (uint32x4_t)a7;
        int64x2_t v12 = (int64x2_t)vpadalq_u32(vpadalq_u32((uint64x2_t)v12, v31), (uint32x4_t)a7);
        a2[-1] = (uint32x4_t)a8;
        int64x2_t v11 = (int64x2_t)vpadalq_u32(v33, (uint32x4_t)a8);
        a3 -= 64LL;
      }

      if (a3 >= 32)
      {
        uint32x4_t v34 = *a1;
        a1 += 2;
        a7 = (__n128)v34;
        a8 = (uint64x2_t)a1[-1];
        *a2 = v34;
        a2 += 2;
        int64x2_t v12 = (int64x2_t)vpadalq_u32((uint64x2_t)v12, v34);
        a2[-1] = (uint32x4_t)a8;
        int64x2_t v11 = (int64x2_t)vpadalq_u32((uint64x2_t)v11, (uint32x4_t)a8);
        a3 -= 32LL;
      }

      uint64x2_t v35 = (uint64x2_t)vaddq_s64(v12, v11);
      if (a3 >= 16)
      {
        uint32x4_t v36 = *a1++;
        a7 = (__n128)v36;
        *a2++ = v36;
        uint64x2_t v35 = vpadalq_u32(v35, v36);
        LOBYTE(a3) = a3 - 16;
      }

      int8x16_t v37 = veorq_s8((int8x16_t)v11, (int8x16_t)v11);
      uint64x2_t v38 = (uint64x2_t)veorq_s8((int8x16_t)a7, (int8x16_t)a7);
      uint32x4_t v39 = (uint32x4_t)veorq_s8((int8x16_t)a8, (int8x16_t)a8);
      if ((a3 & 8) != 0)
      {
        uint64_t v40 = a1->i64[0];
        a1 = (uint32x4_t *)((char *)a1 + 8);
        v37.i64[0] = v40;
        a2->i64[0] = v40;
        a2 = (uint32x4_t *)((char *)a2 + 8);
      }

      if ((a3 & 4) != 0)
      {
        __int32 v41 = a1->i32[0];
        a1 = (uint32x4_t *)((char *)a1 + 4);
        v38.i32[0] = v41;
        a2->i32[0] = v41;
        a2 = (uint32x4_t *)((char *)a2 + 4);
      }

      uint64x2_t v42 = vpadalq_u32(v35, (uint32x4_t)v37);
      uint32x4_t v43 = (uint32x4_t)veorq_s8(v37, v37);
      if ((a3 & 2) != 0)
      {
        __int16 v44 = a1->i16[0];
        a1 = (uint32x4_t *)((char *)a1 + 2);
        v39.i16[0] = v44;
        a2->i16[0] = v44;
        a2 = (uint32x4_t *)((char *)a2 + 2);
      }

      if ((a3 & 1) != 0)
      {
        v43.i8[0] = a1->i8[0];
        a2->i8[0] = a1->i8[0];
      }

      unint64_t v45 = vaddvq_s64((int64x2_t)vpadalq_u32(vpadalq_u32(v42, v43), (uint32x4_t)vpadalq_u32(v38, v39)));
      unint64_t v8 = (unsigned __int16)(v45 + WORD2(v45)) + ((v45 + HIDWORD(v45)) >> 16);
    }
  }

  if (v9) {
    unint64_t v8 = (v8 << 8) + (v8 >> 24);
  }
  unint64_t v46 = (unsigned __int16)a4 + (a4 >> 16) + (v8 >> 16);
  unint64_t v47 = (unsigned __int16)(v46 + v8) + ((v46 + (unsigned __int16)v8) >> 16);
  return (unsigned __int16)v47 + (v47 >> 16);
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0xFFFFFC010];
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  BOOLean_t v3 = va_arg(va, void *);
  return __sem_open(a1, a2, v3);
}

int shm_open(const char *a1, int a2, ...)
{
  BOOLean_t v3 = va_arg(va, void *);
  return __shm_open(a1, a2, v3);
}

int msgsys(int a1, ...)
{
  BOOLean_t v3 = va_arg(va, void *);
  vm_size_t v4 = va_arg(va, void *);
  int v1 = __msgsys(a1, v3, v4);
  return semsys(v1);
}

int semsys(int a1, ...)
{
  v2 = va_arg(va, void *);
  BOOLean_t v3 = va_arg(va, void *);
  return __semsys(a1, v2, v3);
}

int semctl(int a1, int a2, int a3, ...)
{
  return __semctl(a1, a2, a3);
}

int shmsys(int a1, ...)
{
  v2 = va_arg(va, void *);
  BOOLean_t v3 = va_arg(va, void *);
  return __shmsys(a1, v2, v3);
}

uint64_t ____sigwait_nocancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___sigwait_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __abort_with_payload(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_abort_with_payload, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  int result = mac_syscall(SYS_accept, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t accept_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_accept_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int accessx_np(const accessx_descriptor *a1, size_t a2, int *a3, uid_t a4)
{
  int64_t v9 = mac_syscall(SYS_access_extended, (void *)a1, (void *)a2, a3, *(void **)&a4, v5, v6, v7, v8);
  if (v4) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t aio_suspend_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_aio_suspend_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  int result = mac_syscall(SYS_bind, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __bsdthread_create(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_bsdthread_create, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __bsdthread_ctl(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_bsdthread_ctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __bsdthread_register(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_bsdthread_register, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __bsdthread_terminate( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_bsdthread_terminate, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __channel_get_info(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___channel_get_info, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __channel_get_opt(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___channel_get_opt, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __channel_open(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___channel_open, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __channel_set_opt(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___channel_set_opt, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __channel_sync(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___channel_sync, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __chmod(const char *a1, mode_t a2)
{
  int result = mac_syscall(SYS_chmod, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __chmod_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_chmod_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t close_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_close_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __coalition(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_coalition, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __coalition_info(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_coalition_info, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __coalition_ledger(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_MAXSYSCALL, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  int result = mac_syscall(SYS_connect, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t connect_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_connect_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __copyfile(const char *a1, const char *a2, _copyfile_state *a3, copyfile_flags_t a4)
{
  int result = mac_syscall(SYS_copyfile, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __crossarch_trap(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(38, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __csrctl(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_csrctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __debug_syscall_reject( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(547, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __debug_syscall_reject_config( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(548, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __delete(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_delete, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __disable_threadsignal( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___disable_threadsignal, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __execve(const char *a1, char *const *a2, char *const *a3)
{
  int result = mac_syscall(SYS_execve, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

void _exit(int a1)
{
  if (v1) {
    cerror_nocancel(v2);
  }
}

int __fchmod(int a1, mode_t a2)
{
  int result = mac_syscall(SYS_fchmod, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __fchmod_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fchmod_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __fcntl(int a1, int a2, void *a3)
{
  int result = mac_syscall(SYS_fcntl, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t __fcntl_nocancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fcntl_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int64_t __fork(uint64_t a1, uint64_t a2)
{
  int64_t result = mac_syscall(SYS_fork);
  if (v2)
  {
    cerror(result);
    return 0xFFFFFFFFLL;
  }

  else if (a2)
  {
    int64_t result = 0LL;
    _current_pid = 0;
  }

  return result;
}

uint64_t __fs_snapshot(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fs_snapshot, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __fstat64_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fstat64_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __fstat_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fstat_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fsync_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fsync_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  int result = mac_syscall(SYS_getattrlist, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __getdirentries64(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_getdirentries64, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __gethostuuid(unsigned __int8 *a1, const timespec *a2)
{
  int result = mac_syscall(SYS_gethostuuid, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

char *__getlogin()
{
  int result = mac_syscall(SYS_getlogin);
  if (v0) {
    return (char *)cerror((int)result);
  }
  return result;
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  int result = mac_syscall(SYS_getpeername, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t getpid(void)
{
  pid_t result = _current_pid;
  if (_current_pid <= 0) {
    return cerror_nocancel(mac_syscall(SYS_getpid));
  }
  return result;
}

int __getrlimit(int a1, rlimit *a2)
{
  int result = mac_syscall(SYS_getrlimit, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getsgroups_np(int *a1, uuid_t a2)
{
  int64_t v9 = mac_syscall(SYS_getsgroups, a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  int result = mac_syscall(SYS_getsockname, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  int64_t v9 = mac_syscall(SYS_gettid, a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int __gettimeofday_with_mach(timeval *a1, void *a2)
{
  int result = mac_syscall(SYS_gettimeofday, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int __gettimeofday(timeval *a1, void *a2)
{
  int result = mac_syscall(SYS_gettimeofday, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getwgroups_np(int *a1, uuid_t a2)
{
  int64_t v9 = mac_syscall(SYS_getwgroups, a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t __guarded_open_dprotected_np( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_open_dprotected_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __guarded_open_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_open_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __identitysvc(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_identitysvc, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __initgroups(const char *a1, int a2)
{
  int result = mac_syscall(SYS_initgroups, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int __ioctl(int a1, unint64_t a2, void *a3)
{
  int result = mac_syscall(SYS_ioctl, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t __iopolicysys(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_iopolicysys, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __kdebug_trace(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kdebug_trace, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __kdebug_trace64(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kdebug_trace64, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __kdebug_trace_string( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kdebug_trace_string, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t __kdebug_typefilter(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kdebug_typefilter, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __kill(pid_t a1, int a2)
{
  int result = mac_syscall(SYS_kill, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __kqueue_workloop_ctl( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kqueue_workloop_ctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  int result = mac_syscall(SYS_lchown, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int listen(int a1, int a2)
{
  int result = mac_syscall(SYS_listen, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __log_data(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(533, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  off_t result = mac_syscall(SYS_lseek, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t __lstat64_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_lstat64_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __lstat_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_lstat_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __sandbox_me(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_execve, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_fd(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_fd, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_file(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_file, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_link(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_link, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_mount(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_mount, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_pid(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_pid, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_get_proc(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_get_proc, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_getfsstat(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_getfsstat, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __sandbox_mm(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_mount, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_set_fd(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_set_fd, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_set_file(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_set_file, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mac_set_link(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_set_link, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __sandbox_msp(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_set_proc, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __sandbox_ms(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mac_syscall, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mach_bridge_remote_time( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___mach_bridge_remote_time, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mach_eventlink_signal( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(496, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mach_eventlink_signal_wait_until( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(498, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mach_eventlink_wait_until( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(497, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __map_with_linking_np( const mwl_region regions[], uint32_t regionCount, const mwl_info_hdr *blob, uint32_t blobSize)
{
  int64_t v9 = mac_syscall(550, (void *)regions, *(void **)&regionCount, (void *)blob, *(void **)&blobSize, v5, v6, v7, v8);
  if (v4) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t __memorystatus_available_memory( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(534, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __microstackshot(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_microstackshot, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mkdir_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_mkdir_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __mkfifo_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_mkfifo_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

void *__mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  uint64_t result = mac_syscall(SYS_mmap, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return (void *)cerror_nocancel((int)result);
  }
  return result;
}

int mprotect(void *a1, size_t a2, int a3)
{
  int result = mac_syscall(SYS_mprotect, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int msgctl(int a1, int a2, __msqid_ds_new *a3)
{
  int result = mac_syscall(SYS_msgctl, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t msgrcv_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_msgrcv_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t msgsnd_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_msgsnd_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __msgsys(int a1, void *a2, void *a3)
{
  int result = mac_syscall(SYS_msgsys, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int msync(void *a1, size_t a2, int a3)
{
  int result = mac_syscall(SYS_msync, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t msync_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_msync_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __munmap(void *a1, size_t a2)
{
  int result = mac_syscall(SYS_munmap, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_create(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_create, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_deregister(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_deregister, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_destroy(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_destroy, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_get_opt(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_get_opt, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_open(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_open, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_register(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_register, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __nexus_set_opt(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___nexus_set_opt, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __open(const char *a1, int a2, void *a3)
{
  int result = mac_syscall(SYS_open, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int __open_dprotected_np(const char *a1, int a2, int a3, int a4)
{
  int result = mac_syscall(SYS_open_dprotected_np, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __open_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_open_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __open_nocancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_open_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __openat(int a1, const char *a2, int a3)
{
  int result = mac_syscall(SYS_openat, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t __openat_dprotected_np( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(218, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __openat_nocancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_openat_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __persona(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_persona, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int pipe(int a1[2])
{
  int v4 = mac_syscall(SYS_pipe, a1);
  if (v1) {
    return cerror_nocancel(v4);
  }
  *a1 = v4;
  a1[1] = v2;
  return 0;
}

uint64_t poll_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_poll_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const *a5, char *const *a6)
{
  int result = mac_syscall(SYS_posix_spawn, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror(result);
  }
  return result;
}

uint64_t pread_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pread_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t preadv_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(542, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __proc_info(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_proc_info, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __proc_info_extended_id( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(545, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __process_policy(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_process_policy, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __pselect(int a1, fd_set *a2, fd_set *a3, fd_set *a4, const timespec *a5, const sigset_t *a6)
{
  int result = mac_syscall(SYS_pselect, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror(result);
  }
  return result;
}

uint64_t __pselect_nocancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pselect_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_cvbroad(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_cvbroad, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_cvclrprepost( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_cvclrprepost, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_cvsignal(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_cvsignal, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_cvwait(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_cvwait, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_mutexdrop(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_mutexdrop, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_mutexwait(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_mutexwait, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_downgrade( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_downgrade, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_longrdlock( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_longrdlock, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_rdlock(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_rdlock, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_unlock(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_unlock, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_unlock2(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_unlock2, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_upgrade(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_upgrade, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_wrlock(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_wrlock, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __psynch_rw_yieldwrlock( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_psynch_rw_yieldwrlock, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __pthread_canceled(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___pthread_canceled, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __pthread_chdir(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___pthread_chdir, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __pthread_fchdir(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___pthread_fchdir, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __pthread_kill(_opaque_pthread_t *a1, int a2)
{
  int result = mac_syscall(SYS___pthread_kill, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __pthread_markcancel(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___pthread_markcancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  int result = mac_syscall(SYS___pthread_sigmask, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int ptrace(int _request, pid_t _pid, caddr_t _addr, int _data)
{
  errno = 0;
  int result = mac_syscall(SYS_ptrace, _request, _pid, _addr, _data);
  if (v4) {
    return cerror(result);
  }
  return result;
}

uint64_t pwrite_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pwrite_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t pwritev_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(543, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t read_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_read_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t readv_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_readv_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __reboot(int a1)
{
  int result = mac_syscall(SYS_reboot, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __record_system_event( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(552, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  ssize_t result = mac_syscall(SYS_recvfrom, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror(result);
  }
  return result;
}

uint64_t recvfrom_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_recvfrom_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  ssize_t result = mac_syscall(SYS_recvmsg, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t recvmsg_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_recvmsg_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

void __rename( const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  int v4 = mac_syscall(SYS_rename, (const char *)__from, (const char *)__to);
  if (v3) {
    cerror(v4);
  }
}

int __renameat(int a1, const char *a2, int a3, const char *a4)
{
  int result = mac_syscall(SYS_renameat, a1, a2, a3, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

int __renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  int result = mac_syscall(SYS_renameatx_np, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int __rmdir(const char *a1)
{
  int result = mac_syscall(SYS_rmdir, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int select_DARWIN_EXTSN(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  int result = mac_syscall(SYS_select, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror(result);
  }
  return result;
}

uint64_t select_DARWIN_EXTSN_NOCANCEL( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_select_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

sem_t *__sem_open(const char *a1, int a2, void *a3)
{
  uint64_t result = mac_syscall(SYS_sem_open, a1, a2, a3);
  if (v3) {
    return (sem_t *)cerror_nocancel((int)result);
  }
  return result;
}

uint64_t sem_wait_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sem_wait_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __semctl(int a1, int a2, int a3)
{
  int result = mac_syscall(SYS_semctl, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int __semsys(int a1, void *a2, void *a3)
{
  int result = mac_syscall(SYS_semsys, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __semwait_signal(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___semwait_signal, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t __semwait_signal_nocancel( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS___semwait_signal_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  ssize_t result = mac_syscall(SYS_sendmsg, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t sendmsg_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sendmsg_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  ssize_t result = mac_syscall(SYS_sendto, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror(result);
  }
  return result;
}

uint64_t sendto_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sendto_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  int result = mac_syscall(SYS_setattrlist, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int __setlogin(const char *a1)
{
  int result = mac_syscall(SYS_setlogin, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int __setpriority(int a1, id_t a2, int a3)
{
  int result = mac_syscall(SYS_setpriority, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int setregid(gid_t a1, gid_t a2)
{
  int result = mac_syscall(SYS_setregid, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int setreuid(uid_t a1, uid_t a2)
{
  int result = mac_syscall(SYS_setreuid, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int __setrlimit(int a1, const rlimit *a2)
{
  int result = mac_syscall(SYS_setrlimit, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int setsgroups_np(int a1, const uuid_t a2)
{
  int64_t v9 = mac_syscall(SYS_setsgroups, *(void **)&a1, (void *)a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  int64_t v9 = mac_syscall(SYS_settid, *(void **)&a1, *(void **)&a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t __settid_with_pid(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_settid_with_pid, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __settimeofday(const timeval *a1, const timezone *a2)
{
  int result = mac_syscall(SYS_settimeofday, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int setwgroups_np(int a1, const uuid_t a2)
{
  int64_t v9 = mac_syscall(SYS_setwgroups, *(void **)&a1, (void *)a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t __sfi_ctl(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sfi_ctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __sfi_pidctl(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sfi_pidctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __shared_region_check_np(uint64_t *a1)
{
  int result = mac_syscall(SYS_shared_region_check_np, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __shared_region_map_and_slide_2_np( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(536, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __shm_open(const char *a1, int a2, void *a3)
{
  int result = mac_syscall(SYS_shm_open, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int shmctl(int a1, int a2, __shmid_ds_new *a3)
{
  int result = mac_syscall(SYS_shmctl, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int __shmsys(int a1, void *a2, void *a3)
{
  int result = mac_syscall(SYS_shmsys, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int __sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  int result = mac_syscall(SYS_sigaction, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int __sigaltstack(const stack_t *a1, stack_t *a2)
{
  int result = mac_syscall(SYS_sigaltstack, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

uint64_t __sigreturn(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sigreturn, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

int __sigsuspend(const sigset_t *a1)
{
  int result = mac_syscall(SYS_sigsuspend, a1);
  if (v1) {
    return cerror(result);
  }
  return result;
}

uint64_t __sigsuspend_nocancel( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sigsuspend_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __sigwait(const sigset_t *a1, int *a2)
{
  int result = mac_syscall(SYS___sigwait, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  int result = mac_syscall(SYS_socketpair, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __stack_snapshot_with_config( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_stack_snapshot_with_config, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __stat64_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_stat64_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __stat_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_stat_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int syscall(int a1, ...)
{
  char v3 = va_arg(va, void *);
  char v4 = va_arg(va, void *);
  char v5 = va_arg(va, void *);
  char v6 = va_arg(va, void *);
  v7 = va_arg(va, void *);
  char v8 = va_arg(va, void *);
  int64_t v9 = va_arg(va, void *);
  int result = mac_syscall(SYS_syscall, a1, v3, v4, v5, v6, v7, v8, v9);
  if (v1) {
    return cerror(result);
  }
  return result;
}

int __sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  int result = mac_syscall(SYS_sysctl, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int __sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  int result = mac_syscall(SYS_sysctlbyname, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __telemetry(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_telemetry, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __terminate_with_payload( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_terminate_with_payload, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __thread_selfid(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_thread_selfid, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t __thread_selfusage(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_thread_selfusage, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t __ulock_wait(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_ulock_wait, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __ulock_wait2(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(544, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __ulock_wake(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_ulock_wake, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __umask_extended(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_umask_extended, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int __unlink(const char *a1)
{
  int result = mac_syscall(SYS_unlink, a1);
  if (v1) {
    return cerror(result);
  }
  return result;
}

int __unlinkat(int a1, const char *a2, int a3)
{
  int result = mac_syscall(SYS_unlinkat, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int64_t __vfork(uint64_t a1, int a2)
{
  do
  {
    unsigned int v2 = __ldxr((unsigned int *)&_current_pid);
    BOOL v3 = v2 != 0;
    int v4 = v2 - 1;
    if (v4 < 0) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = -1;
    }
  }

  while (__stxr(v5, (unsigned int *)&_current_pid));
  int64_t result = mac_syscall(SYS_vfork);
  if (v3)
  {
    cerror(result);
    int64_t result = 0xFFFFFFFFLL;
  }

  else if (a2)
  {
    return 0LL;
  }

  do
    unsigned int v7 = __ldxr((unsigned int *)&_current_pid);
  while (__stxr(v7 + 1, (unsigned int *)&_current_pid));
  return result;
}

int __wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  int result = mac_syscall(SYS_wait4, a1, a2, a3, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  int64_t v9 = mac_syscall(SYS_wait4_nocancel, *(void **)&a1, a2, *(void **)&a3, a4, v5, v6, v7, v8);
  if (v4) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t waitid_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_waitid_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __work_interval_ctl(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_work_interval_ctl, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __workq_kernreturn(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_workq_kernreturn, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t __workq_open(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_workq_open, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t write_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_write_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t writev_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_writev_nocancel, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int access(const char *a1, int a2)
{
  int result = mac_syscall(SYS_access, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

int acct(const char *a1)
{
  int result = mac_syscall(SYS_acct, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int adjtime(const timeval *a1, timeval *a2)
{
  int result = mac_syscall(SYS_adjtime, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int aio_cancel(int fd, aiocb *aiocbp)
{
  int result = mac_syscall(SYS_aio_cancel, fd, aiocbp);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int aio_error(const aiocb *aiocbp)
{
  int result = mac_syscall(SYS_aio_error, aiocbp);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int aio_fsync(int op, aiocb *aiocbp)
{
  int result = mac_syscall(SYS_aio_fsync, op, aiocbp);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int aio_read(aiocb *aiocbp)
{
  int result = mac_syscall(SYS_aio_read, aiocbp);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t aio_return(aiocb *aiocbp)
{
  ssize_t result = mac_syscall(SYS_aio_return, aiocbp);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int aio_suspend(const aiocb *const aiocblist[], int nent, const timespec *timeoutp)
{
  int result = mac_syscall(SYS_aio_suspend, aiocblist, nent, timeoutp);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int aio_write(aiocb *aiocbp)
{
  int result = mac_syscall(SYS_aio_write, aiocbp);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int audit(const void *a1, int a2)
{
  int result = mac_syscall(SYS_audit, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

au_asid_t audit_session_join(mach_port_name_t port)
{
  au_asid_t result = mac_syscall(SYS_audit_session_join, port);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int audit_session_port(au_asid_t asid, mach_port_name_t *portname)
{
  int result = mac_syscall(SYS_audit_session_port, asid, portname);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

mach_port_name_t audit_session_self(void)
{
  mach_port_name_t result = mac_syscall(SYS_audit_session_self);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int auditctl(const char *a1)
{
  int result = mac_syscall(SYS_auditctl, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int auditon(int a1, void *a2, int a3)
{
  int result = mac_syscall(SYS_auditon, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t change_fdguard_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_change_fdguard_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int chdir(const char *a1)
{
  int result = mac_syscall(SYS_chdir, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int chflags(const char *a1, __uint32_t a2)
{
  int result = mac_syscall(SYS_chflags, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  int result = mac_syscall(SYS_chown, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int chroot(const char *a1)
{
  int result = mac_syscall(SYS_chroot, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int clonefileat(int a1, const char *a2, int a3, const char *a4, uint32_t a5)
{
  int result = mac_syscall(SYS_clonefileat, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int close(int a1)
{
  int result = mac_syscall(SYS_close, a1);
  if (v1) {
    return cerror(result);
  }
  return result;
}

uint64_t coalition_policy_get(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(557, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t coalition_policy_set(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(556, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int connectx( int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  int result = mac_syscall(SYS_connectx, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t csops(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_csops, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t csops_audittoken(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_csops_audittoken, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int disconnectx(int a1, sae_associd_t a2, sae_connid_t a3)
{
  int result = mac_syscall(SYS_disconnectx, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int dup(int a1)
{
  int result = mac_syscall(SYS_dup, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int dup2(int a1, int a2)
{
  int result = mac_syscall(SYS_dup2, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int exchangedata(const char *a1, const char *a2, unsigned int a3)
{
  int result = mac_syscall(SYS_exchangedata, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  int result = mac_syscall(SYS_faccessat, a1, a2, a3, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

int fchdir(int a1)
{
  int result = mac_syscall(SYS_fchdir, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int fchflags(int a1, __uint32_t a2)
{
  int result = mac_syscall(SYS_fchflags, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  int result = mac_syscall(SYS_fchmodat, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  int result = mac_syscall(SYS_fchown, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  int result = mac_syscall(SYS_fchownat, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  int result = mac_syscall(SYS_fclonefileat, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fdatasync(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fdatasync, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  int result = mac_syscall(SYS_ffsctl, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  int result = mac_syscall(SYS_fgetattrlist, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  ssize_t result = mac_syscall(SYS_fgetxattr, fd, name, value, size, position, options);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int fhopen(const fhandle *a1, int a2)
{
  int result = mac_syscall(SYS_fhopen, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fileport_makefd(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fileport_makefd, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fileport_makeport(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_fileport_makeport, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  ssize_t result = mac_syscall(SYS_flistxattr, fd, namebuff, size, options);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int flock(int a1, int a2)
{
  int result = mac_syscall(SYS_flock, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int fmount(const char *a1, int a2, int a3, void *a4)
{
  int result = mac_syscall(SYS_fmount, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fpathconf(int a1, int a2)
{
  uint64_t result = mac_syscall(SYS_fpathconf, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

ssize_t freadlink(int a1, char *a2, size_t a3)
{
  ssize_t result = mac_syscall(551, *(void **)&a1, a2, (void *)a3, v4, v5, v6, v7, v8);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int fremovexattr(int fd, const char *name, int options)
{
  int result = mac_syscall(SYS_fremovexattr, fd, name, options);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  int result = mac_syscall(SYS_fsctl, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  int result = mac_syscall(SYS_fsetattrlist, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  int result = mac_syscall(SYS_fsetxattr, fd, name, value, size, position, options);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  ssize_t result = mac_syscall(SYS_fsgetpath, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t fsgetpath_ext(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(217, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int fstat64(int a1, stat *a2)
{
  int64_t v9 = mac_syscall(SYS_fstat64, *(void **)&a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int fstatat64(int a1, const char *a2, stat *a3, int a4)
{
  int64_t v9 = mac_syscall(SYS_fstatat64, *(void **)&a1, (void *)a2, a3, *(void **)&a4, v5, v6, v7, v8);
  if (v4) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int fstatfs64(int a1, statfs *a2)
{
  int64_t v9 = mac_syscall(SYS_fstatfs64, *(void **)&a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int fsync(int a1)
{
  int result = mac_syscall(SYS_fsync, a1);
  if (v1) {
    return cerror(result);
  }
  return result;
}

int ftruncate(int a1, off_t a2)
{
  int result = mac_syscall(SYS_ftruncate, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int futimes(int a1, const timeval *a2)
{
  int result = mac_syscall(SYS_futimes, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  int result = mac_syscall(SYS_getattrlistat, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  int result = mac_syscall(SYS_getattrlistbulk, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int getaudit_addr(auditinfo_addr *a1, int a2)
{
  int result = mac_syscall(SYS_getaudit_addr, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getauid(au_id_t *a1)
{
  int result = mac_syscall(SYS_getauid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int getdirentries(int a1, char *a2, int a3, uint64_t *a4)
{
  int result = mac_syscall(SYS_getdirentries, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int getdirentriesattr( int a1, void *a2, void *a3, size_t a4, unsigned int *a5, unsigned int *a6, unsigned int *a7, unsigned int a8)
{
  int result = mac_syscall(SYS_getdirentriesattr, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int getdtablesize(void)
{
  int result = mac_syscall(SYS_getdtablesize);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

gid_t getegid(void)
{
  gid_t result = mac_syscall(SYS_getegid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int getentropy(void *buffer, size_t size)
{
  int result = mac_syscall(SYS_getentropy, buffer, size);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uid_t geteuid(void)
{
  uid_t result = mac_syscall(SYS_geteuid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int getfh(const char *a1, fhandle_t *a2)
{
  int result = mac_syscall(SYS_getfh, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getfsstat64(statfs *a1, int a2, int a3)
{
  int64_t v9 = mac_syscall(SYS_getfsstat64, a1, *(void **)&a2, *(void **)&a3, v4, v5, v6, v7, v8);
  if (v3) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

gid_t getgid(void)
{
  gid_t result = mac_syscall(SYS_getgid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int getgroups(int a1, gid_t a2[])
{
  int result = mac_syscall(SYS_getgroups, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getitimer(int a1, itimerval *a2)
{
  int result = mac_syscall(SYS_getitimer, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t getpgid(pid_t a1)
{
  pid_t result = mac_syscall(SYS_getpgid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t getpgrp(void)
{
  pid_t result = mac_syscall(SYS_getpgrp);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t getppid(void)
{
  pid_t result = mac_syscall(SYS_getppid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int getpriority(int a1, id_t a2)
{
  int result = mac_syscall(SYS_getpriority, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int getrusage(int a1, rusage *a2)
{
  int result = mac_syscall(SYS_getrusage, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t getsid(pid_t a1)
{
  pid_t result = mac_syscall(SYS_getsid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  int result = mac_syscall(SYS_getsockopt, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

uid_t getuid(void)
{
  uid_t result = mac_syscall(SYS_getuid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  ssize_t result = mac_syscall(SYS_getxattr, path, name, value, size, position, options);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t grab_pgo_data(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_grab_pgo_data, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t graftdmg(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(549, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t guarded_close_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_close_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t guarded_kqueue_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_kqueue_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t guarded_pwrite_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_pwrite_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t guarded_write_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_write_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t guarded_writev_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_guarded_writev_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int issetugid(void)
{
  int result = mac_syscall(SYS_issetugid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t kas_info(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kas_info, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  int result = mac_syscall(SYS_kevent, kq, changelist, nchanges, eventlist, nevents, timeout);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int kevent64( int kq, const kevent64_s *changelist, int nchanges, kevent64_s *eventlist, int nevents, unsigned int flags, const timespec *timeout)
{
  int result = mac_syscall(SYS_kevent64, kq, changelist, nchanges, eventlist, nevents, flags, timeout);
  if (v7) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t kevent_id(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kevent_id, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t kevent_qos(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_kevent_qos, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int kqueue(void)
{
  int result = mac_syscall(SYS_kqueue);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t ledger(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_ledger, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int link(const char *a1, const char *a2)
{
  int result = mac_syscall(SYS_link, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  int result = mac_syscall(SYS_linkat, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror(result);
  }
  return result;
}

int lio_listio(int mode, aiocb *const aiocblist[], int nent, sigevent *sigp)
{
  int result = mac_syscall(SYS_lio_listio, mode, aiocblist, nent, sigp);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  ssize_t result = mac_syscall(SYS_listxattr, path, namebuff, size, options);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

int lstat64(const char *a1, stat *a2)
{
  int64_t v9 = mac_syscall(SYS_lstat64, (void *)a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int posix_madvise(void *a1, size_t a2, int a3)
{
  int result = mac_syscall(SYS_madvise, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t memorystatus_control(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_memorystatus_control, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t memorystatus_get_level( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_memorystatus_get_level, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int mincore(const void *a1, size_t a2, char *a3)
{
  int result = mac_syscall(SYS_mincore, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int minherit(void *a1, size_t a2, int a3)
{
  int result = mac_syscall(SYS_minherit, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int mkdir(const char *a1, mode_t a2)
{
  int result = mac_syscall(SYS_mkdir, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  int result = mac_syscall(SYS_mkdirat, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int mkfifo(const char *a1, mode_t a2)
{
  int result = mac_syscall(SYS_mkfifo, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int mkfifoat(int a1, const char *a2, mode_t a3)
{
  int64_t v9 = mac_syscall(553, *(void **)&a1, (void *)a2, (void *)a3, v4, v5, v6, v7, v8);
  if (v3) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int mknod(const char *a1, mode_t a2, dev_t a3)
{
  int result = mac_syscall(SYS_mknod, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int mknodat(int a1, const char *a2, mode_t a3, dev_t a4)
{
  int64_t v9 = mac_syscall(554, *(void **)&a1, (void *)a2, (void *)a3, *(void **)&a4, v5, v6, v7, v8);
  if (v4) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int mlock(const void *a1, size_t a2)
{
  int result = mac_syscall(SYS_mlock, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int mlockall(int a1)
{
  int result = mac_syscall(SYS_mlockall, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  int result = mac_syscall(SYS_mount, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t mremap_encrypted(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_mremap_encrypted, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int msgget(key_t a1, int a2)
{
  int result = mac_syscall(SYS_msgget, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t msgrcv(int a1, void *a2, size_t a3, uint64_t a4, int a5)
{
  ssize_t result = mac_syscall(SYS_msgrcv, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror(result);
  }
  return result;
}

int msgsnd(int a1, const void *a2, size_t a3, int a4)
{
  int result = mac_syscall(SYS_msgsnd, a1, a2, a3, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

int munlock(const void *a1, size_t a2)
{
  int result = mac_syscall(SYS_munlock, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int munlockall(void)
{
  int result = mac_syscall(SYS_munlockall);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t necp_client_action(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_necp_client_action, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t necp_match_policy(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_necp_match_policy, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t necp_open(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_necp_open, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t necp_session_action(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_necp_session_action, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t necp_session_open(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_necp_session_open, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t net_qos_guideline(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_net_qos_guideline, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t netagent_trigger(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_netagent_trigger, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int nfssvc(int a1, void *a2)
{
  int result = mac_syscall(SYS_nfssvc, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int ntp_adjtime(timex *a1)
{
  int result = mac_syscall(SYS_ntp_adjtime, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int ntp_gettime(ntptimeval *a1)
{
  int result = mac_syscall(SYS_ntp_gettime, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t objc_bp_assist_cfg_np( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(535, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t openbyid_np(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_openbyid_np, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t os_fault_with_payload( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_os_fault_with_payload, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int panic_with_data(uuid_t uuid, void *addr, uint32_t len, uint32_t flags, const char *msg)
{
  int64_t v9 = mac_syscall(185, uuid, addr, *(void **)&len, *(void **)&flags, (void *)msg, v6, v7, v8);
  if (v5) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

uint64_t pathconf(const char *a1, int a2)
{
  uint64_t result = mac_syscall(SYS_pathconf, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

uint64_t peeloff(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_peeloff, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror(result);
  }
  return result;
}

uint64_t pid_hibernate(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pid_hibernate, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t pid_resume(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pid_resume, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t pid_shutdown_sockets(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pid_shutdown_sockets, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t pid_suspend(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_pid_suspend, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t pivot_root(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(537, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  int result = mac_syscall(SYS_poll, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  ssize_t result = mac_syscall(SYS_pread, __fd, __buf, __nbyte, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

ssize_t preadv(int a1, const iovec *a2, int a3, off_t a4)
{
  ssize_t result = mac_syscall(540, *(void **)&a1, (void *)a2, *(void **)&a3, (void *)a4, v5, v6, v7, v8);
  if (v4) {
    return cerror(result);
  }
  return result;
}

uint64_t proc_rlimit_control(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_proc_rlimit_control, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t proc_trace_log(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_proc_trace_log, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t proc_uuid_policy(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_proc_uuid_policy, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  ssize_t result = mac_syscall(SYS_pwrite, __fd, __buf, __nbyte, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

ssize_t pwritev(int a1, const iovec *a2, int a3, off_t a4)
{
  ssize_t result = mac_syscall(541, *(void **)&a1, (void *)a2, *(void **)&a3, (void *)a4, v5, v6, v7, v8);
  if (v4) {
    return cerror(result);
  }
  return result;
}

int quotactl(const char *a1, int a2, int a3, caddr_t a4)
{
  int result = mac_syscall(SYS_quotactl, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t read(int a1, void *a2, size_t a3)
{
  ssize_t result = mac_syscall(SYS_read, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  ssize_t result = mac_syscall(SYS_readlink, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t readlinkat(int a1, const char *a2, char *a3, size_t a4)
{
  ssize_t result = mac_syscall(SYS_readlinkat, a1, a2, a3, a4);
  if (v4) {
    return cerror_nocancel(result);
  }
  return result;
}

ssize_t readv(int a1, const iovec *a2, int a3)
{
  ssize_t result = mac_syscall(SYS_readv, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

uint64_t recvmsg_x(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_recvmsg_x, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t register_uexc_handler( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(519, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int removexattr(const char *path, const char *name, int options)
{
  int result = mac_syscall(SYS_removexattr, path, name, options);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int revoke(const char *a1)
{
  int result = mac_syscall(SYS_revoke, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int searchfs( const char *a1, fssearchblock *a2, unint64_t *a3, unsigned int a4, unsigned int a5, searchstate *a6)
{
  int result = mac_syscall(SYS_searchfs, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int sem_close(sem_t *a1)
{
  int result = mac_syscall(SYS_sem_close, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int sem_post(sem_t *a1)
{
  int result = mac_syscall(SYS_sem_post, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int sem_trywait(sem_t *a1)
{
  int result = mac_syscall(SYS_sem_trywait, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int sem_unlink(const char *a1)
{
  int result = mac_syscall(SYS_sem_unlink, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int sem_wait(sem_t *a1)
{
  int result = mac_syscall(SYS_sem_wait, a1);
  if (v1) {
    return cerror(result);
  }
  return result;
}

int semget(key_t a1, int a2, int a3)
{
  int result = mac_syscall(SYS_semget, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int semop(int a1, sembuf *a2, size_t a3)
{
  int result = mac_syscall(SYS_semop, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int sendfile(int a1, int a2, off_t a3, off_t *a4, sf_hdtr *a5, int a6)
{
  int result = mac_syscall(SYS_sendfile, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t sendmsg_x(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_sendmsg_x, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int setattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, uint32_t a6)
{
  int result = mac_syscall(SYS_setattrlistat, a1, a2, a3, a4, a5, a6);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int setaudit_addr(const auditinfo_addr *a1, int a2)
{
  int result = mac_syscall(SYS_setaudit_addr, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int setauid(const au_id_t *a1)
{
  int result = mac_syscall(SYS_setauid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int setegid(gid_t a1)
{
  int result = mac_syscall(SYS_setegid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int seteuid(uid_t a1)
{
  int result = mac_syscall(SYS_seteuid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int setgid(gid_t a1)
{
  int result = mac_syscall(SYS_setgid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int setgroups(int a1, const gid_t *a2)
{
  int result = mac_syscall(SYS_setgroups, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int setitimer(int a1, const itimerval *a2, itimerval *a3)
{
  int result = mac_syscall(SYS_setitimer, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int setpgid(pid_t a1, pid_t a2)
{
  int result = mac_syscall(SYS_setpgid, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t setprivexec(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_setprivexec, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

pid_t setsid(void)
{
  pid_t result = mac_syscall(SYS_setsid);
  if (v0) {
    return cerror_nocancel(result);
  }
  return result;
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  int result = mac_syscall(SYS_setsockopt, a1, a2, a3, a4, a5);
  if (v5) {
    return cerror_nocancel(result);
  }
  return result;
}

int setuid(uid_t a1)
{
  int result = mac_syscall(SYS_setuid, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  int result = mac_syscall(SYS_setxattr, path, name, value, size, position, options);
  if (v6) {
    return cerror_nocancel(result);
  }
  return result;
}

int shm_unlink(const char *a1)
{
  int result = mac_syscall(SYS_shm_unlink, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

void *__cdecl shmat(int a1, const void *a2, int a3)
{
  int result = mac_syscall(SYS_shmat, a1, a2, a3);
  if (v3) {
    return (void *)cerror_nocancel((int)result);
  }
  return result;
}

int shmdt(const void *a1)
{
  int result = mac_syscall(SYS_shmdt, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int shmget(key_t a1, size_t a2, int a3)
{
  int result = mac_syscall(SYS_shmget, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int shutdown(int a1, int a2)
{
  int result = mac_syscall(SYS_shutdown, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int sigpending(sigset_t *a1)
{
  int result = mac_syscall(SYS_sigpending, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  int result = mac_syscall(SYS_sigprocmask, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

int socket(int a1, int a2, int a3)
{
  int result = mac_syscall(SYS_socket, a1, a2, a3);
  if (v3) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t socket_delegate(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_socket_delegate, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int stat64(const char *a1, stat *a2)
{
  int64_t v9 = mac_syscall(SYS_stat64, (void *)a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int statfs64(const char *a1, statfs *a2)
{
  int64_t v9 = mac_syscall(SYS_statfs64, (void *)a1, a2, v3, v4, v5, v6, v7, v8);
  if (v2) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int swapon(const char *a1)
{
  int result = mac_syscall(SYS_swapon, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int symlink(const char *a1, const char *a2)
{
  int result = mac_syscall(SYS_symlink, a1, a2);
  if (v2) {
    return cerror(result);
  }
  return result;
}

int symlinkat(const char *a1, int a2, const char *a3)
{
  int result = mac_syscall(SYS_symlinkat, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

void sync(void)
{
  if (v0) {
    cerror(v1);
  }
}

uint64_t system_override(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_system_override, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t task_inspect_for_pid(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(538, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t task_read_for_pid(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(539, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t thread_selfcounts(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_thread_selfcounts, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int tracker_action(int action, char *buffer, size_t buffer_size)
{
  int64_t v9 = mac_syscall(546, *(void **)&action, buffer, (void *)buffer_size, v4, v5, v6, v7, v8);
  if (v3) {
    LODWORD(v9) = cerror_nocancel(v9);
  }
  return v9;
}

int truncate(const char *a1, off_t a2)
{
  int result = mac_syscall(SYS_truncate, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

mode_t umask(mode_t a1)
{
  LOWORD(v2) = mac_syscall(SYS_umask, a1);
  if (v1) {
    LOWORD(v2) = cerror_nocancel(v2);
  }
  return v2;
}

int undelete(const char *a1)
{
  int result = mac_syscall(SYS_undelete, a1);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t ungraftdmg(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(555, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int unmount(const char *a1, int a2)
{
  int result = mac_syscall(SYS_unmount, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

int usrctl(uint32_t flags)
{
  int result = mac_syscall(SYS_usrctl, flags);
  if (v1) {
    return cerror_nocancel(result);
  }
  return result;
}

int utimes(const char *a1, const timeval *a2)
{
  int result = mac_syscall(SYS_utimes, a1, a2);
  if (v2) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t vfs_purge(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_vfs_purge, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

uint64_t vm_pressure_monitor(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = mac_syscall(SYS_vm_pressure_monitor, a1, a2, a3, a4, a5, a6, a7, a8);
  if (v8) {
    return cerror_nocancel(result);
  }
  return result;
}

int waitid(idtype_t a1, id_t a2, siginfo_t *a3, int a4)
{
  int result = mac_syscall(SYS_waitid, a1, a2, a3, a4);
  if (v4) {
    return cerror(result);
  }
  return result;
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  ssize_t result = mac_syscall(SYS_write, __fd, __buf, __nbyte);
  if (v3) {
    return cerror(result);
  }
  return result;
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  ssize_t result = mac_syscall(SYS_writev, a1, a2, a3);
  if (v3) {
    return cerror(result);
  }
  return result;
}

int64_t _thread_set_tsd_base(void *a1)
{
  return mac_syscall(MACHDEP_SYSCALL_TRAP, 2LL, a1);
}

uint64_t __libkernel_platform_init(void *a1)
{
  _libkernel_string_functions = a1;
  return 0LL;
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __n)
{
  return (void *)(*((uint64_t (**)(void *, const void *, size_t))_libkernel_string_functions + 4))( __dst,  __src,  __n);
}

uint64_t __libkernel_voucher_init(uint64_t *a1)
{
  _libkernel_voucher_functions = a1;
  return 0LL;
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  char v1 = (uint64_t (*)(mach_msg_header_t *))_libkernel_voucher_functions[1];
  if (v1) {
    return v1(msg);
  }
  else {
    return 0;
  }
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
  char v1 = (void (*)(mach_msg_header_t *))_libkernel_voucher_functions[2];
  if (v1) {
    v1(msg);
  }
}

voucher_mach_msg_state_t voucher_mach_msg_adopt(mach_msg_header_t *msg)
{
  char v1 = (uint64_t (*)(mach_msg_header_t *))_libkernel_voucher_functions[3];
  if (v1) {
    return (voucher_mach_msg_state_t)v1(msg);
  }
  else {
    return (voucher_mach_msg_state_t)-1LL;
  }
}

void voucher_mach_msg_revert(voucher_mach_msg_state_t state)
{
  char v1 = (void (*)(voucher_mach_msg_state_t))_libkernel_voucher_functions[4];
  if (v1) {
    v1(state);
  }
}

uint64_t _libkernel_strlen(_BYTE *a1)
{
  char v1 = a1;
  if ((a1 & 7) != 0)
  {
    if (*a1)
    {
      char v1 = &a1[-(a1 & 7) + 8];
      char v2 = a1 + 1;
      char v3 = a1;
      do
      {
        if ((((_BYTE)v3 + 1) & 7) == 0) {
          goto LABEL_7;
        }
        int v4 = *v2++;
        ++v3;
      }

      while (v4);
    }

    else
    {
      char v3 = a1;
    }

    return v3 - a1;
  }

  else
  {
LABEL_7:
    while (1)
    {
      unint64_t v5 = *(void *)v1;
      if (((*(void *)v1 - 0x101010101010101LL) & 0x8080808080808080LL) != 0)
      {
        if ((v5 & 0xFF00) == 0) {
          return v1 - a1 + 1;
        }
        if ((v5 & 0xFF0000) == 0) {
          return v1 - a1 + 2;
        }
        if ((v5 & 0xFF000000) == 0) {
          return v1 - a1 + 3;
        }
        if ((v5 & 0xFF00000000LL) == 0) {
          return v1 - a1 + 4;
        }
        if ((v5 & 0xFF0000000000LL) == 0) {
          return v1 - a1 + 5;
        }
        if ((v5 & 0xFF000000000000LL) == 0) {
          return v1 - a1 + 6;
        }
        if (!HIBYTE(v5)) {
          break;
        }
      }

      v1 += 8;
    }

    return v1 - a1 + 7;
  }

uint64_t __libkernel_init(uint64_t result)
{
  _libkernel_functions = result;
  if (*(void *)(result + 8)) {
    _dlsym = *(_UNKNOWN **)(result + 8);
  }
  if ((mach_init_mach_init_inited & 1) == 0)
  {
    ssize_t result = mach_init_doit();
    mach_init_mach_init_inited = 1;
  }

  return result;
}

uint64_t __libkernel_init_late(uint64_t result)
{
  if (*(void *)result >= 3uLL)
  {
    if (*(_BYTE *)(result + 10))
    {
      posix_spawn_with_filter = (uint64_t)_posix_spawn_with_filter;
      execve_with_filter = (uint64_t)_execve_with_filter;
    }
  }

  return result;
}

uint64_t __libkernel_init_after_boot_tasks(uint64_t result)
{
  if (*(void *)result)
  {
    if (*(_BYTE *)(result + 8))
    {
      posix_spawn_with_filter = (uint64_t)_posix_spawn_with_filter;
      execve_with_filter = (uint64_t)_execve_with_filter;
    }
  }

  return result;
}

char *_libkernel_strchr(char *result, char a2)
{
  int v2 = *result;
  if (a2 != v2)
  {
    while ((_BYTE)v2)
    {
      int v3 = *++result;
      LOBYTE(v2) = v3;
      if (a2 == v3) {
        return result;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t _libkernel_strcmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    int v2 = *a1;
    uint64_t v3 = v2 - *a2;
    if ((_DWORD)v3) {
      break;
    }
    ++a2;
    ++a1;
    if (!v2) {
      return 0LL;
    }
  }

  return v3;
}

int *_libkernel_bzero(int *a1, unint64_t a2)
{
  return _libkernel_memset(a1, 0, a2);
}

int *_libkernel_memset(int *result, unsigned __int8 a2, unint64_t a3)
{
  if (a3 > 0xB)
  {
    uint64_t v4 = result & 3;
    if ((result & 3) != 0)
    {
      uint64_t v5 = 4 - v4;
      unint64_t v6 = v4 | 0xFFFFFFFFFFFFFFFCLL;
      char v7 = result;
      do
      {
        *(_BYTE *)char v7 = a2;
        char v7 = (int *)((char *)v7 + 1);
      }

      while (!__CFADD__(v6++, 1LL));
      a3 -= v5;
    }

    else
    {
      char v7 = result;
    }

    unint64_t v9 = a3 >> 2;
    do
    {
      *v7++ = a2 | (a2 << 8);
      --v9;
    }

    while (v9);
    if ((a3 & 3) != 0)
    {
      uint64_t v10 = 0LL;
      do
        *((_BYTE *)v7 + v10++) = a2;
      while ((a3 & 3) != v10);
    }
  }

  else if (a3)
  {
    uint64_t v3 = result;
    do
    {
      *(_BYTE *)uint64_t v3 = a2;
      uint64_t v3 = (int *)((char *)v3 + 1);
      --a3;
    }

    while (a3);
  }

  return result;
}

char *_libkernel_memmove(char *result, char *a2, unint64_t a3)
{
  if (result != a2 && a3)
  {
    if (result >= a2)
    {
      char v8 = &a2[a3];
      unint64_t v9 = &result[a3];
      if (((((_BYTE)a2 + a3) | ((_BYTE)result + a3)) & 3) != 0)
      {
        BOOL v10 = ((v8 ^ v9) & 3) == 0 && a3 >= 5;
        unint64_t v11 = v8 & 3;
        if (!v10) {
          unint64_t v11 = a3;
        }
        unint64_t v12 = v11;
        do
        {
          char v13 = *--v8;
          *--unint64_t v9 = v13;
          --v12;
        }

        while (v12);
        a3 -= v11;
      }

      if (a3 >= 4)
      {
        unint64_t v14 = a3 >> 2;
        do
        {
          int v15 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v9 - 1) = v15;
          v9 -= 4;
          --v14;
        }

        while (v14);
      }

      unint64_t v16 = a3 & 3;
      if ((a3 & 3) != 0)
      {
        uint64x2_t v17 = v9 - 1;
        uint32x4_t v18 = v8 - 1;
        do
        {
          char v19 = *v18--;
          *v17-- = v19;
          --v16;
        }

        while (v16);
      }
    }

    else
    {
      if (((a2 | result) & 3) != 0)
      {
        uint64_t v3 = 4LL - (a2 & 3);
        uint64_t v5 = result;
        uint64_t v6 = v3;
        do
        {
          char v7 = *a2++;
          *v5++ = v7;
          --v6;
        }

        while (v6);
        a3 -= v3;
      }

      else
      {
        uint64_t v5 = result;
      }

      if (a3 >= 4)
      {
        unint64_t v20 = a3 >> 2;
        do
        {
          int v21 = *(_DWORD *)a2;
          a2 += 4;
          *(_DWORD *)uint64_t v5 = v21;
          v5 += 4;
          --v20;
        }

        while (v20);
      }

      unint64_t v22 = a3 & 3;
      if ((a3 & 3) != 0)
      {
        do
        {
          char v23 = *a2++;
          *v5++ = v23;
          --v22;
        }

        while (v22);
      }
    }
  }

  return result;
}

char *_libkernel_strcpy(char *a1, char *a2)
{
  unint64_t v4 = _libkernel_strlen(a2) + 1;
  return _libkernel_memmove(a1, a2, v4);
}

BOOL _posix_spawn_with_filter( pid_t *a1, const char *a2, const posix_spawnattr_t *a3, void *a4, __int128 *a5, int *a6)
{
  v114 = a2;
  if (a4 && (uint64_t v11 = *a4) != 0)
  {
    unint64_t v12 = a4 + 1;
    while ((unint64_t)(*((uint64_t (**)(uint64_t))_libkernel_string_functions + 12))(v11) < 0x20
         || (*((unsigned int (**)(uint64_t, const char *, uint64_t))_libkernel_string_functions + 3))( v11,  "POSIX_SPAWN_FILTERING_RULES_PATH",  32LL)
         || *(_BYTE *)(v11 + 32) != 61)
    {
      uint64_t v13 = *v12++;
      uint64_t v11 = v13;
      if (!v13) {
        goto LABEL_8;
      }
    }

    unint64_t v14 = (const char *)(v11 + 33);
  }

  else
  {
LABEL_8:
    if (can_access("/private/var/mobile/Library/posix_spawn_filtering_rules")) {
      unint64_t v14 = "/private/var/mobile/Library/posix_spawn_filtering_rules";
    }
    else {
      unint64_t v14 = 0LL;
    }
  }

  if (v14) {
    int v15 = (char *)v14;
  }
  else {
    int v15 = "/usr/local/share/posix_spawn_filtering_rules";
  }
  bzero(v128, 0x400uLL);
  memset(v127, 0, sizeof(v127));
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64x2_t v17 = *(int **)(StatusReg + 8);
  if (!v17) {
    uint64x2_t v17 = &errno;
  }
  int v18 = *v17;
  BOOL result = can_access(v15);
  if (result)
  {
    v105 = a5;
    while (1)
    {
      unsigned int v25 = __open_nocancel(v15, (void *)0x1000000, 0LL, v20, v21, v22, v23, v24);
      if ((v25 & 0x80000000) == 0) {
        break;
      }
      uint64x2_t v26 = *(int **)(StatusReg + 8);
      if (!v26) {
        uint64x2_t v26 = &errno;
      }
      if (*v26 != 4)
      {
        BOOL result = 0LL;
        *uint64x2_t v26 = v18;
        return result;
      }
    }

    unsigned int v107 = v25;
    v102 = a6;
    unint64_t v103 = StatusReg;
    int v104 = v18;
    v99 = a4;
    v100 = a1;
    v101 = a3;
    uint64x2_t v27 = v114;
    do
    {
      uint32x4_t v28 = v27;
      uint64_t v29 = (*((uint64_t (**)(const char *, uint64_t))_libkernel_string_functions + 7))(v27, 47LL);
      uint64x2_t v27 = (const char *)(v29 + 1);
    }

    while (v29);
    unsigned int v109 = 0;
    int v30 = 0;
    uint64_t v31 = 0LL;
    v106 = (char *)&v129[1] + 3;
    v117 = (char *)v129 + 12;
    v112 = (char *)v129 + 11;
    v113 = (char *)v129 + 8;
    uint32x4_t v32 = v128;
    v108 = v127;
    uint64_t v33 = 16LL;
    uint64_t v110 = 0LL;
    unint64_t v111 = 1024LL;
    do
    {
      uint64_t v116 = v33;
      bzero((char *)v129 + v31, 1024 - v31);
      uint64_t NOCANCEL = read_NOCANCEL((void *)v107, (char *)v129 + v31, (void *)(1024 - v31), v34, v35, v36, v37, v38);
      if (!NOCANCEL) {
        break;
      }
      v31 += NOCANCEL;
      if (v31)
      {
        while (1)
        {
          unint64_t v47 = (_BYTE *)(*((uint64_t (**)(_OWORD *, uint64_t, uint64_t))_libkernel_string_functions + 2))( v129,  10LL,  v31);
          if (!v47) {
            goto LABEL_57;
          }
          v48 = v47;
          *unint64_t v47 = 0;
          if (!(*((unsigned int (**)(_OWORD *, const char *, uint64_t))_libkernel_string_functions + 3))( v129,  "binary_name:",  12LL)) {
            break;
          }
          if (!(*((unsigned int (**)(_OWORD *, const char *, uint64_t))_libkernel_string_functions + 3))( v129,  "path_start:",  11LL))
          {
            uint64_t v57 = (*((uint64_t (**)(char *))_libkernel_string_functions + 12))(v112);
            int v56 = (*((uint64_t (**)(const char *, char *, uint64_t))_libkernel_string_functions + 13))( v114,  v112,  v57);
            goto LABEL_38;
          }

          if (!(*((unsigned int (**)(_OWORD *, const char *, uint64_t))_libkernel_string_functions + 3))( v129,  "add_env:",  8LL))
          {
            int v115 = v30;
            v58 = v28;
            size_t v59 = (*((uint64_t (**)(const void *))_libkernel_string_functions + 12))(v113) + 1;
            unint64_t v60 = v111 - v59;
            uint64_t v61 = v116;
            if (v111 >= v59 && v116 != 0)
            {
              memmove(v32, v113, v59);
              v63 = v108;
              void *v108 = v32;
              v108 = v63 + 1;
              uint64_t v116 = v61 - 1;
              v32 += v59;
              unint64_t v111 = v60;
            }

            uint32x4_t v28 = v58;
            int v30 = v115;
            goto LABEL_39;
          }

          int v49 = (*((uint64_t (**)(_OWORD *, const char *, uint64_t))_libkernel_string_functions + 3))( v129,  "binpref:",  8LL);
          v50 = (uint64_t (*)(const void *, const char *, uint64_t))*((void *)_libkernel_string_functions + 3);
          if (!v49)
          {
            int v64 = v50(v113, "x86_64", 7LL);
            if (v64) {
              int v65 = v110;
            }
            else {
              int v65 = 16777223;
            }
            int v66 = v109;
            if (!v64) {
              int v66 = -1;
            }
            unsigned int v109 = v66;
            LODWORD(v110) = v65;
            goto LABEL_39;
          }

          int v51 = v50(v129, "alt_rosetta:", 12LL);
          v52 = (uint64_t (*)(char *, const char *, uint64_t))*((void *)_libkernel_string_functions + 3);
          if (!v51)
          {
            int v53 = v52(v117, "1", 2LL);
            int v54 = HIDWORD(v110);
            int v55 = HIDWORD(v110) | 2;
            goto LABEL_54;
          }

          if (!v52((char *)v129, "has_sec_transition:", 19LL))
          {
            int v53 = (*((uint64_t (**)(char *, const char *, uint64_t))_libkernel_string_functions + 3))( v106,  "1",  2LL);
            int v54 = HIDWORD(v110);
            int v55 = HIDWORD(v110) | 8;
LABEL_54:
            if (!v53) {
              int v54 = v55;
            }
            HIDWORD(v110) = v54;
          }

LABEL_39:
          memmove(v129, v48 + 1, 1024 - (v48 - (_BYTE *)v129));
          v31 += ~(v48 - (_BYTE *)v129);
          if (!v31) {
            goto LABEL_57;
          }
        }

        int v56 = (*((uint64_t (**)(const char *, char *))_libkernel_string_functions + 8))(v28, v117);
LABEL_38:
        v30 |= v56 == 0;
        goto LABEL_39;
      }

LABEL_57:
      uint64_t v33 = v116;
    }

    while (v31 != 1024);
    close_NOCANCEL((void *)v107, v40, v41, v42, v43, v44, v45, v46);
    v67 = *(int **)(v103 + 8);
    if (!v67) {
      v67 = &errno;
    }
    int *v67 = v104;
    if ((v30 & 1) != 0)
    {
      __int128 v125 = 0u;
      __int128 v126 = 0u;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      __int128 v119 = 0u;
      __int128 v120 = 0u;
      __int128 v118 = 0u;
      memset(v129, 0, sizeof(v129));
      *(void *)&__int128 v135 = -1LL;
      *((void *)&v135 + 1) = -1LL;
      __int128 v130 = 0uLL;
      *(void *)((char *)&v132 + 4) = -1LL;
      LODWORD(v132) = 0;
      HIDWORD(v132) = -1;
      *(void *)&__int128 v131 = 0LL;
      *((void *)&v131 + 1) = 1LL;
      HIDWORD(v134) = 0;
      *(void *)&v138[0] = 0LL;
      BYTE8(v138[0]) = 0;
      __int128 v136 = 0uLL;
      DWORD2(v137) = 0;
      *(void *)&__int128 v137 = 0LL;
      *(void *)((char *)v138 + 12) = 0LL;
      *(void *)((char *)&v138[1] + 4) = 0LL;
      memset(&v138[2], 0, 48);
      uint64_t v139 = 0LL;
      *(void *)&__int128 v134 = 0LL;
      __int128 v133 = 0uLL;
      WORD4(v134) = 0;
      if (v105)
      {
        __int128 v68 = v105[7];
        __int128 v124 = v105[6];
        __int128 v125 = v68;
        __int128 v126 = v105[8];
        __int128 v69 = v105[3];
        __int128 v120 = v105[2];
        __int128 v121 = v69;
        __int128 v70 = v105[5];
        __int128 v122 = v105[4];
        __int128 v123 = v70;
        __int128 v71 = v105[1];
        __int128 v118 = *v105;
        __int128 v119 = v71;
        if (*((void *)&v118 + 1))
        {
          __int128 v72 = **((_OWORD **)&v118 + 1);
          __int128 v73 = *(_OWORD *)(*((void *)&v118 + 1) + 16LL);
          __int128 v74 = *(_OWORD *)(*((void *)&v118 + 1) + 32LL);
          __int128 v131 = *(_OWORD *)(*((void *)&v118 + 1) + 48LL);
          __int128 v130 = v74;
          v129[1] = v73;
          v129[0] = v72;
          __int128 v75 = *(_OWORD *)(*((void *)&v118 + 1) + 64LL);
          __int128 v76 = *(_OWORD *)(*((void *)&v118 + 1) + 80LL);
          __int128 v77 = *(_OWORD *)(*((void *)&v118 + 1) + 96LL);
          __int128 v135 = *(_OWORD *)(*((void *)&v118 + 1) + 112LL);
          __int128 v134 = v77;
          __int128 v133 = v76;
          __int128 v132 = v75;
          __int128 v78 = *(_OWORD *)(*((void *)&v118 + 1) + 128LL);
          __int128 v79 = *(_OWORD *)(*((void *)&v118 + 1) + 144LL);
          __int128 v80 = *(_OWORD *)(*((void *)&v118 + 1) + 160LL);
          v138[1] = *(_OWORD *)(*((void *)&v118 + 1) + 176LL);
          v138[0] = v80;
          __int128 v137 = v79;
          __int128 v136 = v78;
          __int128 v81 = *(_OWORD *)(*((void *)&v118 + 1) + 192LL);
          __int128 v82 = *(_OWORD *)(*((void *)&v118 + 1) + 208LL);
          __int128 v83 = *(_OWORD *)(*((void *)&v118 + 1) + 224LL);
          uint64_t v139 = *(void *)(*((void *)&v118 + 1) + 240LL);
          v138[4] = v83;
          v138[3] = v82;
          v138[2] = v81;
        }
      }

      *((void *)&v118 + 1) = v129;
      v85 = v100;
      v84 = v101;
      v86 = v99;
      if ((_DWORD)v110)
      {
        *((void *)&v135 + 1) = -1LL;
        v129[1] = v110;
        *(void *)&__int128 v135 = v109 | 0xFFFFFFFF00000000LL;
      }

      if (HIDWORD(v110)) {
        LODWORD(v136) = v136 | HIDWORD(v110);
      }
      if (*v99)
      {
        uint64_t v87 = 0LL;
        do
          uint64_t v88 = v87 + 1;
        while (v99[++v87]);
      }

      else
      {
        uint64_t v88 = 0LL;
      }

      for (uint64_t i = 0LL; i != 16; ++i)
      {
        if (!v127[i]) {
          break;
        }
      }

      unint64_t v91 = 8 * (v88 + 1 + i);
      v92 = (char *)&v98 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      size_t v93 = 8 * i;
      if (v91 <= 8 * i) {
        size_t v94 = 0LL;
      }
      else {
        size_t v94 = 8 * (v88 + 1);
      }
      v95 = &v92[8 * i];
      bzero(v95, v94);
      memmove(v92, v127, v93);
      memmove(v95, v86, 8 * v88);
      int v97 = __posix_spawn(v85, v114, (const posix_spawn_file_actions_t *)&v118, v84, (char *const *)v92, v96);
      int *v102 = v97;
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

          uint64x2_t v26 = *(unsigned int *)(v8 + 56);
          if ((_DWORD)v26 == -1
            || (uint64x2_t v26 = *(void *)(a1 + 96LL * v7 + 152) + v26 * *(unsigned __int16 *)(v17 + 26)) == 0)
          {
            qword_18C50D128 = (uint64_t)"bad packet: no buflet";
            __break(1u);
LABEL_60:
            qword_18C50D128 = (uint64_t)"invalid buflet count";
            qword_18C50D158 = v24;
            __break(1u);
LABEL_61:
            qword_18C50D128 = (uint64_t)"non terminating buflet chain";
            __break(1u);
          }

          *(void *)(v8 + 32) = v26;
          *(void *)(v8 + 40) = 0LL;
LABEL_17:
          uint64x2_t v27 = 0;
          uint32x4_t v28 = (void *)(a1 + 96LL * v7);
          uint64_t v29 = v28 + 16;
          int v30 = v28 + 15;
          uint64_t v31 = v28 + 19;
          uint32x4_t v32 = v26;
          do
          {
            uint64_t v33 = *(_DWORD *)(v32 + 20);
            if (v33 == -1)
            {
              uint64x2_t v38 = 0LL;
            }

            else
            {
              uint32x4_t v34 = *(_WORD *)(v32 + 40);
              uint64x2_t v35 = (v34 & 2) == 0;
              if ((v34 & 2) != 0) {
                uint32x4_t v36 = 20LL;
              }
              else {
                uint32x4_t v36 = 16LL;
              }
              if (v35) {
                int8x16_t v37 = v30;
              }
              else {
                int8x16_t v37 = v29;
              }
              uint64x2_t v38 = *v37 + (*(_DWORD *)(v17 + v36) * v33);
            }

            *(void *)(v32 + 8) = v38;
            uint32x4_t v39 = *(_DWORD *)(v32 + 24);
            if (v39 == -1)
            {
              *(void *)uint32x4_t v32 = 0LL;
              uint64x2_t v17 = (v27 + 1);
              if ((_DWORD)v17 != (_DWORD)v24) {
                goto LABEL_60;
              }
              goto LABEL_35;
            }

            uint64_t v40 = *v31 + v39 * *(unsigned __int16 *)(v17 + 26);
            *(void *)uint32x4_t v32 = v40;
            uint32x4_t v32 = v40;
          }

          while (v40);
          BOOL v24 = **(unsigned int **)(a1 + 96LL * v7 + 80);
          if ((v24 & 0x80000000) != 0) {
            goto LABEL_61;
          }
          return 6LL;
        }

BOOL can_access(const char *a1)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v2 = *(int **)(StatusReg + 8);
  if (!v2) {
    int v2 = &errno;
  }
  int v3 = *v2;
  int v4 = access(a1, 4);
  if (v4)
  {
    uint64_t v5 = *(int **)(StatusReg + 8);
    if (!v5) {
      uint64_t v5 = &errno;
    }
    int *v5 = v3;
  }

  return v4 == 0;
}

uint64_t _execve_with_filter(const char *a1, char *const *a2, char **a3)
{
  int v41 = 0;
  memset(&v40[1], 0, 128);
  uint64_t v10 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v25 = -1LL;
  uint64_t v26 = -1LL;
  v8[1] = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  int v12 = 0;
  int v17 = 0;
  uint64_t v18 = -1LL;
  int v19 = -1;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  uint64_t v15 = 0LL;
  uint64_t v16 = 1LL;
  int v24 = 0;
  uint64_t v31 = 0LL;
  char v32 = 0;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  int v30 = 0;
  uint64_t v27 = 0LL;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v20 = 0LL;
  __int16 v23 = 0;
  v8[0] = 64;
  *(void *)&v40[0] = 248LL;
  *((void *)&v40[0] + 1) = v8;
  if (!_posix_spawn_with_filter(0LL, a1, (const posix_spawnattr_t *)a2, a3, v40, &v41)) {
    return __execve(a1, a2, a3);
  }
  if (!v41) {
    return 0LL;
  }
  uint64_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v6) {
    uint64_t v6 = &errno;
  }
  int *v6 = v41;
  return 0xFFFFFFFFLL;
}

unint64_t _libkernel_strlcpy(char *a1, char *a2, unint64_t a3)
{
  unint64_t v6 = _libkernel_strlen(a2);
  unint64_t v7 = v6;
  if (v6 >= a3)
  {
    if (a3)
    {
      unint64_t v8 = a3 - 1;
      _libkernel_memmove(a1, a2, v8);
      a1[v8] = 0;
    }
  }

  else
  {
    _libkernel_memmove(a1, a2, v6 + 1);
  }

  return v7;
}

uint64_t mach_host_special_port_description(unsigned int a1)
{
  if (a1 <= 0x23) {
    return mach_host_special_port_description_hsp_descs[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t mach_task_special_port_description(unsigned int a1)
{
  if (a1 <= 0xB) {
    return mach_task_special_port_description_tsp_descs[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t mach_thread_special_port_description(unsigned int a1)
{
  if (a1 <= 3) {
    return mach_thread_special_port_description_tsp_descs[a1];
  }
  else {
    return 0LL;
  }
}

uint64_t mach_host_special_port_for_id(uint64_t a1)
{
  return port_for_id_internal(a1, (uint64_t)&mach_host_special_port_for_id_hsp_ids, 0x1Fu);
}

uint64_t port_for_id_internal(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = a3;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + 8 * v5);
      if (v7)
      {
      }

      if (v6 == ++v5)
      {
        unint64_t v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        if (!v8) {
          unint64_t v8 = &errno;
        }
        int v9 = 2;
        goto LABEL_12;
      }
    }
  }

  else
  {
    unint64_t v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      unint64_t v8 = &errno;
    }
    int v9 = 22;
LABEL_12:
    *unint64_t v8 = v9;
    return 0xFFFFFFFFLL;
  }

  return v5;
}

uint64_t mach_task_special_port_for_id(uint64_t a1)
{
  return port_for_id_internal(a1, (uint64_t)&mach_task_special_port_for_id_tsp_ids, 0xCu);
}

uint64_t mach_thread_special_port_for_id(uint64_t a1)
{
  return port_for_id_internal(a1, (uint64_t)&mach_thread_special_port_for_id_tsp_ids, 4u);
}

void pkt_subtype_assert_fail(uint64_t a1)
{
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = a1;
  __break(1u);
}

void pkt_type_assert_fail(uint64_t a1)
{
  qword_18C50D128 = (uint64_t)"invalid packet type";
  qword_18C50D158 = a1;
  __break(1u);
}

uint64_t os_packet_set_headroom(uint64_t a1, unsigned int a2)
{
  if ((a1 & 0xF) == 0xA)
  {
    unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    if (*(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x3C) > a2)
    {
      uint64_t result = 0LL;
      *(_BYTE *)(v2 + 82) = a2;
      return result;
    }
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = a1;
    __break(1u);
  }

  return 34LL;
}

uint64_t os_packet_get_headroom(uint64_t result)
{
  if ((result & 0xF) == 0xA) {
    return *(unsigned __int8 *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x52);
  }
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = result;
  __break(1u);
  return result;
}

uint64_t os_packet_set_link_header_length(uint64_t a1, unsigned int a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if (*(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x3C) < a2) {
    return 34LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(v2 + 83) = a2;
  return result;
}

uint64_t os_packet_get_link_header_length(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return *(unsigned __int8 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x53);
}

uint64_t os_packet_set_link_broadcast(uint64_t result)
{
  if ((result & 0xF) == 0xA)
  {
    *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) |= 1u;
    return 0LL;
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = result;
    __break(1u);
  }

  return result;
}

uint64_t os_packet_get_link_broadcast(uint64_t result)
{
  if ((result & 0xF) == 0xA) {
    return *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) & 1;
  }
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = result;
  __break(1u);
  return result;
}

uint64_t os_packet_set_link_multicast(uint64_t result)
{
  if ((result & 0xF) == 0xA)
  {
    *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) |= 2u;
    return 0LL;
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = result;
    __break(1u);
  }

  return result;
}

uint64_t os_packet_get_link_multicast(uint64_t result)
{
  if ((result & 0xF) == 0xA) {
    return (*(unsigned __int16 *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) >> 1) & 1;
  }
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = result;
  __break(1u);
  return result;
}

uint64_t os_packet_set_link_ethfcs(uint64_t result)
{
  if ((result & 0xF) == 0xA)
  {
    *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) |= 4u;
    return 0LL;
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = result;
    __break(1u);
  }

  return result;
}

uint64_t os_packet_get_link_ethfcs(uint64_t result)
{
  if ((result & 0xF) == 0xA) {
    return (*(unsigned __int16 *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x50) >> 2) & 1;
  }
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = result;
  __break(1u);
  return result;
}

uint64_t os_packet_set_transport_traffic_background(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x8000uLL;
  return 0LL;
}

uint64_t os_packet_get_transport_traffic_background(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 15) & 1;
}

uint64_t os_packet_set_transport_traffic_realtime(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x80000uLL;
  return 0LL;
}

uint64_t os_packet_get_transport_traffic_realtime(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 19) & 1;
}

uint64_t os_packet_set_transport_retransmit(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x200000uLL;
  return 0LL;
}

uint64_t os_packet_get_transport_retransmit(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 21) & 1;
}

uint64_t os_packet_set_transport_last_packet(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x10000000uLL;
  return 0LL;
}

uint64_t os_packet_set_service_class(uint64_t a1, int a2)
{
  uint64_t result = 22LL;
  if (a2 <= 2621727)
  {
    if (a2 <= 1048703)
    {
      if (!a2) {
        goto LABEL_16;
      }
      int v4 = 524432;
    }

    else
    {
      if (a2 == 1048704 || a2 == 1572880) {
        goto LABEL_16;
      }
      int v4 = 2097184;
    }

LABEL_15:
    if (a2 != v4) {
      return result;
    }
    goto LABEL_16;
  }

  if (a2 > 3670319)
  {
    if (a2 == 3670320 || a2 == 4718992) {
      goto LABEL_16;
    }
    int v4 = 4194688;
    goto LABEL_15;
  }

  if (a2 != 2621728 && a2 != 3146000)
  {
    int v4 = 3670272;
    goto LABEL_15;
  }

  if ((v19 & 1) != 0) {
    __int16 v23 = notify;
  }
  else {
    __int16 v23 = 0LL;
  }
  if ((v19 & 0x4003) == 0x4002) {
    msg->msgh_remote_port = notify;
  }
  msgh_bits = msg->msgh_bits;
  msgh_voucher_port = msg->msgh_voucher_port;
  msgh_id = msg->msgh_id;
  uint64_t v28 = (v19 & 1) == 0 || (int)msgh_bits >= 0;
  if ((v19 & 0x100000000LL) != 0)
  {
    if (v28) {
      int v30 = 0LL;
    }
    else {
      int v30 = msg[1].msgh_bits;
    }
    uint64_t v31 = (void *)(msgh_bits | 0x200000000LL);
    char v32 = (void *)(msgh_voucher_port | (msgh_id << 32));
    uint64_t v33 = (void *)(v30 | (v12 << 32));
    uint64_t v34 = (void *)((v23 << 32) | 2);
    uint64_t v35 = (mach_msg_header_t *)v43;
  }

  else
  {
    if (v28) {
      uint64_t v29 = 0LL;
    }
    else {
      uint64_t v29 = msg[1].msgh_bits;
    }
    uint64_t v31 = (void *)(msgh_bits | (v14 << 32));
    char v32 = (void *)(msgh_voucher_port | (msgh_id << 32));
    uint64_t v33 = (void *)(v29 | (v12 << 32));
    uint64_t v34 = (void *)(rcv_size | (unint64_t)(v23 << 32));
    uint64_t v35 = msg;
  }

  return mach_msg2_internal( v35,  v19 | 0x400000000LL,  v31,  *(void **)&msg->msgh_remote_port,  v32,  v33,  v34,  (void *)timeout);
}

LABEL_16:
  uint64_t result = 0LL;
  *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x14) = a2;
  return result;
}

uint64_t os_packet_get_service_class(uint64_t a1)
{
  uint64_t result = 0LL;
  uint64_t v3 = *(unsigned int *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x14);
  if ((int)v3 <= 2621727)
  {
    if ((int)v3 <= 1048703)
    {
      BOOL v4 = (_DWORD)v3 == 0;
      int v5 = 524432;
    }

    else
    {
      BOOL v4 = (_DWORD)v3 == 1048704 || (_DWORD)v3 == 1572880;
      int v5 = 2097184;
    }
  }

  else if ((int)v3 > 3670319)
  {
    BOOL v4 = (_DWORD)v3 == 3670320 || (_DWORD)v3 == 4718992;
    int v5 = 4194688;
  }

  else
  {
    BOOL v4 = (_DWORD)v3 == 2621728 || (_DWORD)v3 == 3146000;
    int v5 = 3670272;
  }

  if (v4 || (_DWORD)v3 == v5) {
    return v3;
  }
  return result;
}

uint64_t os_packet_set_compression_generation_count(uint64_t a1, int a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x5C) = a2;
  return 0LL;
}

uint64_t os_packet_get_compression_generation_count(uint64_t a1, _DWORD *a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  if (!a2) {
    return 22LL;
  }
  int v2 = *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x5C);
  if (!v2) {
    return 2LL;
  }
  uint64_t result = 0LL;
  *a2 = v2;
  return result;
}

uint64_t os_packet_set_traffic_class(uint64_t a1, int a2)
{
  if ((a2 & 0x1FFFFFFu) > 3) {
    int v2 = 0;
  }
  else {
    int v2 = dword_1801F7A70[a2 & 0x1FFFFFF];
  }
  *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x14) = v2;
  return 0LL;
}

uint64_t os_packet_get_traffic_class(uint64_t a1)
{
  uint64_t result = 0LL;
  int v3 = *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x14);
  if (v3 <= 2621727)
  {
    if (v3 <= 1048703)
    {
      BOOL v4 = v3 == 0;
      int v5 = 524432;
    }

    else
    {
      BOOL v4 = v3 == 1048704 || v3 == 1572880;
      int v5 = 2097184;
    }
  }

  else if (v3 > 3670319)
  {
    BOOL v4 = v3 == 3670320 || v3 == 4718992;
    int v5 = 4194688;
  }

  else
  {
    BOOL v4 = v3 == 2621728 || v3 == 3146000;
    int v5 = 3670272;
  }

  if (v4 || v3 == v5) {
    return (unsigned __int16)v3 >> 7;
  }
  return result;
}

uint64_t os_packet_set_inet_checksum(uint64_t a1, int a2, __int16 a3, __int16 a4)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  *(_DWORD *)(v4 + 84) = a2 & 0x300F7F;
  *(_WORD *)(v4 + 88) = a3;
  *(_WORD *)(v4 + 90) = a4;
  return 0LL;
}

uint64_t os_packet_add_inet_csum_flags(uint64_t result, int a2)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(_DWORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x54) |= a2 & 0x300F7F;
  return result;
}

uint64_t os_packet_get_inet_checksum(uint64_t a1, _WORD *a2, _WORD *a3)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  if (a2) {
    *a2 = *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x58);
  }
  if (a3) {
    *a3 = *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x5A);
  }
  return *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x54) & 0x300F7F;
}

__n128 os_packet_get_flow_uuid(uint64_t a1, __n128 *a2)
{
  int v2 = (__n128 *)(a1 & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 7) != 0)
  {
    if ((a2 & 3) != 0)
    {
      __n128 result = *v2;
      *a2 = *v2;
    }

    else
    {
      a2->n128_u32[0] = v2->n128_u32[0];
      a2->n128_u32[1] = *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 4);
      a2->n128_u32[2] = *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 8);
      a2->n128_u32[3] = *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0xC);
    }
  }

  else
  {
    a2->n128_u64[0] = v2->n128_u64[0];
    a2->n128_u64[1] = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 8);
  }

  return result;
}

__n128 os_packet_set_flow_uuid(uint64_t a1, __n128 *a2)
{
  int v2 = (_OWORD *)(a1 & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 7) != 0)
  {
    if ((a2 & 3) != 0)
    {
      __n128 result = *a2;
      _OWORD *v2 = *a2;
    }

    else
    {
      *(_DWORD *)int v2 = a2->n128_u32[0];
      *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 4) = a2->n128_u32[1];
      *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 8) = a2->n128_u32[2];
      *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0xC) = a2->n128_u32[3];
    }
  }

  else
  {
    *(void *)int v2 = a2->n128_u64[0];
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 8) = a2->n128_u64[1];
  }

  return result;
}

uint64_t os_packet_clear_flow_uuid(uint64_t result)
{
  char v1 = (void *)(result & 0xFFFFFFFFFFFFFFF0LL);
  *char v1 = 0LL;
  v1[1] = 0LL;
  return result;
}

uint64_t os_packet_set_group_start(uint64_t result)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x100000000uLL;
  return result;
}

uint64_t os_packet_get_group_start(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return HIDWORD(*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68)) & 1LL;
}

uint64_t os_packet_set_group_end(uint64_t result)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x200000000uLL;
  return result;
}

uint64_t os_packet_get_group_end(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 33) & 1LL;
}

uint64_t os_packet_get_expire_time(uint64_t a1, void *a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x400000000LL) == 0) {
    return 2LL;
  }
  if (!a2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)(v2 + 128);
  return result;
}

uint64_t os_packet_set_expire_time(uint64_t a1, uint64_t a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(a2 != 0) << 34);
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x80) = a2;
  return 0LL;
}

uint64_t os_packet_get_expiry_action(uint64_t a1, _DWORD *a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x200000000000LL) == 0) {
    return 2LL;
  }
  if (!a2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(unsigned __int8 *)(v2 + 149);
  return result;
}

uint64_t os_packet_set_expiry_action(uint64_t a1, int a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  if (a2) {
    unint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) | 0x200000000000LL;
  }
  else {
    unint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0xFFFFDFFFFFFFFFFFLL;
  }
  *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) = v2;
  *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x95) = a2;
  return 0LL;
}

uint64_t os_packet_get_token(uint64_t a1, void *__dst, _WORD *a3)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x800000000LL) == 0) {
    return 2LL;
  }
  uint64_t result = 22LL;
  if (__dst)
  {
    if (a3)
    {
      size_t v6 = *(unsigned __int16 *)(v3 + 146);
      if (v6 <= (unsigned __int16)*a3)
      {
        if (v6 >= 0x11)
        {
          qword_18C50D128 = (uint64_t)"assertion failed: tlen <= 16";
          __break(1u);
        }

        else
        {
          BOOL v7 = *(unsigned __int8 *)(v3 + 148) != 1;
          memmove(__dst, (const void *)(v3 + 112), v6);
          *a3 = v6;
          return (2 * v7);
        }
      }
    }
  }

  return result;
}

uint64_t os_packet_set_token(uint64_t a1, void *a2, size_t __n)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  __int16 v3 = __n;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if (!(_DWORD)__n)
  {
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x70) = 0LL;
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x78) = 0LL;
    *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x92) = 0;
    *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x94) = 0;
    unint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0xFFFFFFF7FFFFFFFFLL;
LABEL_9:
    uint64_t result = 0LL;
    *(void *)(v4 + 104) = v6;
    return result;
  }

  uint64_t result = 22LL;
  if (a2 && __n <= 0x10)
  {
    if ((a2 & 7) != 0)
    {
      memmove((void *)(v4 + 112), a2, __n);
    }

    else
    {
      *(void *)(v4 + 112) = *a2;
      *(void *)(v4 + 120) = a2[1];
    }

    *(_WORD *)(v4 + 146) = v3;
    *(_BYTE *)(v4 + 148) = 1;
    unint64_t v6 = *(void *)(v4 + 104) | 0x800000000LL;
    goto LABEL_9;
  }

  return result;
}

uint64_t os_packet_get_packetid(uint64_t a1, void *__dst)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x800000000LL) == 0) {
    return 2LL;
  }
  uint64_t result = 22LL;
  if (__dst)
  {
    unsigned int v4 = *(unsigned __int16 *)(v2 + 146);
    if (v4 <= 0x10)
    {
      int v5 = *(unsigned __int8 *)(v2 + 148);
      memmove(__dst, (const void *)(v2 + 112), *(unsigned __int16 *)(v2 + 146));
      if (v4 == 16 && v5 == 2) {
        return 0LL;
      }
      else {
        return 2LL;
      }
    }
  }

  return result;
}

uint64_t os_packet_set_packetid(uint64_t a1, uint64_t a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  if (!a2) {
    return 22LL;
  }
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if ((a2 & 7) != 0)
  {
    *(_OWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x70) = *(_OWORD *)a2;
  }

  else
  {
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x70) = *(void *)a2;
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x78) = *(void *)(a2 + 8);
  }

  uint64_t result = 0LL;
  *(_WORD *)(v2 + 146) = 16;
  *(_BYTE *)(v2 + 148) = 2;
  *(void *)(v2 + 104) |= 0x800000000uLL;
  return result;
}

uint64_t os_packet_set_vlan_tag(uint64_t result, __int16 a2, int a3)
{
  if ((result & 0xF) == 0xA)
  {
    unint64_t v3 = result & 0xFFFFFFFFFFFFFFF0LL;
    *(void *)(v3 + 104) = *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) | 0x40000000000LL;
    *(_WORD *)(v3 + 144) = a2;
    if (a3) {
      *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x80000000000uLL;
    }
    return 0LL;
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = result;
    __break(1u);
  }

  return result;
}

uint64_t os_packet_get_vlan_tag(uint64_t result, _WORD *a2, _DWORD *a3)
{
  if ((result & 0xF) == 0xA)
  {
    unint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68);
    if ((v3 & 0x40000000000LL) != 0)
    {
      if (a2) {
        *a2 = *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x90);
      }
      uint64_t result = 0LL;
      if (a3) {
        *a3 = (v3 >> 43) & 1;
      }
    }

    else
    {
      return 2LL;
    }
  }

  else
  {
    qword_18C50D128 = (uint64_t)"invalid packet subtype";
    qword_18C50D158 = result;
    __break(1u);
  }

  return result;
}

uint64_t os_packet_get_vlan_id(__int16 a1)
{
  return a1 & 0xFFF;
}

uint64_t os_packet_get_vlan_priority(unsigned int a1)
{
  return a1 >> 13;
}

uint64_t os_packet_set_app_metadata(uint64_t a1, int a2, char a3)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  if (a2 == 1)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(v3 + 151) = a3;
    *(void *)(v3 + 104) |= 0x400000000000uLL;
    char v5 = 1;
  }

  else
  {
    char v5 = 0;
    *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) &= ~0x400000000000uLL;
    uint64_t result = 22LL;
  }

  *(_BYTE *)(v3 + 150) = v5;
  return result;
}

uint64_t os_packet_get_wake_flag(uint64_t a1)
{
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 10) & 1;
}

uint64_t os_packet_get_keep_alive(uint64_t a1)
{
  return (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 18) & 1;
}

uint64_t os_packet_set_keep_alive(uint64_t result, int a2)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) = *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)(a2 != 0) << 18);
  return result;
}

uint64_t os_packet_get_truncated(uint64_t result)
{
  if ((result & 0xF) == 0xA) {
    return (*(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) >> 39) & 1LL;
  }
  qword_18C50D128 = (uint64_t)"invalid packet subtype";
  qword_18C50D158 = result;
  __break(1u);
  return result;
}

uint64_t os_packet_set_l4s_flag(uint64_t result)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) |= 0x800000000000uLL;
  return result;
}

uint64_t os_packet_get_data_length(uint64_t a1)
{
  return *(unsigned int *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x10);
}

uint64_t os_packet_get_buflet_count(uint64_t a1)
{
  if ((a1 & 3) == 1) {
    return 1LL;
  }
  if ((a1 & 3) != 2) {
    return 0LL;
  }
  if (*(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A)) {
    return *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A);
  }
  return 1LL;
}

unint64_t os_packet_get_next_buflet(unint64_t result, uint64_t a2)
{
  if ((result & 3) == 1)
  {
    if (!a2 || (result & 0xFFFFFFFFFFFFFFF0LL) + 32 == a2)
    {
      if (a2) {
        return 0LL;
      }
      else {
        return (result & 0xFFFFFFFFFFFFFFF0LL) + 32;
      }
    }

    qword_18C50D128 = (uint64_t)"assertion failed: (((struct __user_buflet *)(uintptr_t)bprev)) == ((void *)0) || (((struc"
                               "t __user_buflet *)(uintptr_t)bprev)) == ((((struct __user_quantum *)(((uint64_t)(ph) & (~"
                               "((uint64_t)0xf)))))))->qum_buf";
    __break(1u);
    return *(void *)result;
  }

  if ((result & 3) != 2) {
    return 0LL;
  }
  unint64_t v2 = result & 0xFFFFFFFFFFFFFFF0LL;
  if (a2 && *(_WORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x9A)) {
    return *(void *)a2;
  }
  uint64_t result = v2 + 32;
  if (!*(void *)(v2 + 40)) {
    return *(void *)result;
  }
  return result;
}

uint64_t os_packet_get_segment_count(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return *(unsigned __int8 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x65);
}

uint64_t os_packet_finalize(unint64_t a1)
{
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x18) &= 0xFFFCu;
  uint64_t v3 = a1 & 3;
  if (v3 == 1)
  {
    int v4 = 1;
  }

  else
  {
    if (v3 != 2)
    {
      int v5 = 0;
      BOOL v7 = (_DWORD *)(v2 + 16);
      goto LABEL_32;
    }

    if (*(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A)) {
      int v4 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A);
    }
    else {
      int v4 = 1;
    }
  }

  int v5 = 0;
  unint64_t v6 = 0LL;
  *(_DWORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x10) = 0;
  BOOL v7 = (_DWORD *)(v2 + 16);
  do
  {
    if (v3 == 2)
    {
      if (v6 && (unint64_t v8 = (unint64_t *)v6, *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A))
        || (unint64_t v8 = (unint64_t *)(v2 + 32), v9 = v2 + 32, !*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x28)))
      {
        unint64_t v9 = *v8;
        if (!*v8) {
          goto LABEL_33;
        }
      }

      if (v6)
      {
        unsigned int v10 = *(_DWORD *)(v9 + 32);
        unint64_t v6 = v9;
        goto LABEL_21;
      }
    }

    else
    {
      if (v6 && v2 + 32 != v6)
      {
        qword_18C50D128 = (uint64_t)"assertion failed: (((struct __user_buflet *)(uintptr_t)bprev)) == ((void *)0) || (((s"
                                   "truct __user_buflet *)(uintptr_t)bprev)) == ((((struct __user_quantum *)(((uint64_t)("
                                   "ph) & (~((uint64_t)0xf)))))))->qum_buf";
        __break(1u);
        goto LABEL_37;
      }

      unint64_t v9 = v2 + 32;
      if (v6) {
        goto LABEL_33;
      }
    }

    unsigned int v10 = *(_DWORD *)(v9 + 32);
    unint64_t v6 = v9;
    unsigned int v1 = v10;
LABEL_21:
    int v11 = *(_DWORD *)(v6 + 36);
    if (v11 + v10 > *(_DWORD *)(v6 + 28)) {
      goto LABEL_33;
    }
    v5 += v11;
    --v4;
  }

  while (v4);
  if (v3 != 2) {
    goto LABEL_32;
  }
  if (v1 > 0xFF) {
    goto LABEL_33;
  }
  *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x52) = v1;
  uint64_t v12 = (a1 >> 2) & 3;
  if (v12 != 1)
  {
    if (v12 == 2) {
      *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x53) = 0;
    }
    goto LABEL_31;
  }

  if (v1 || *(_BYTE *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x53))
  {
LABEL_33:
    uint64_t result = 34LL;
LABEL_34:
    _DWORD *v7 = 0;
    __int16 v14 = 2;
    goto LABEL_35;
  }

LABEL_31:
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x16C0F00000000LL) == 0) {
    goto LABEL_32;
  }
LABEL_37:
  if ((*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x400000000LL) != 0
    && !*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x80)
    || (*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x68) & 0x800000000LL) != 0
    && !*(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x92))
  {
    uint64_t result = 22LL;
    goto LABEL_34;
  }

LABEL_32:
  uint64_t result = 0LL;
  _DWORD *v7 = v5;
  __int16 v14 = 1;
LABEL_35:
  *(_WORD *)(v2 + 24) |= v14;
  return result;
}

uint64_t os_packet_add_buflet(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 22LL;
  if (a3)
  {
    unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF0LL;
    if ((a1 & 0xFFFFFFFFFFFFFFF0LL) != 0 && a3 != a2)
    {
      if ((a1 & 3) != 2) {
        pkt_type_assert_fail(a1);
      }
      unsigned int v6 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x9A);
      if (v6 < *(unsigned __int16 *)(v5 + 152) && (a2 || !v6))
      {
        uint64_t result = 0LL;
        unint64_t v7 = v5 + 32;
        if (a2) {
          unint64_t v7 = a2;
        }
        *(void *)unint64_t v7 = a3;
        *(_DWORD *)(v7 + 24) = *(_DWORD *)(a3 + 16);
        *(_WORD *)(v5 + 154) = v6 + 1;
      }
    }
  }

  return result;
}

uint64_t os_packet_increment_use_count(uint64_t a1)
{
  unint64_t v1 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  int v2 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x4A);
  if (v2 == 0xFFFF) {
    return 34LL;
  }
  uint64_t result = 0LL;
  *(_WORD *)(v1 + 74) = v2 + 1;
  return result;
}

uint64_t os_packet_decrement_use_count(uint64_t a1, _WORD *a2)
{
  unint64_t v2 = a1 & 0xFFFFFFFFFFFFFFF0LL;
  __int16 v3 = *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x4A);
  if (!v3) {
    return 34LL;
  }
  uint64_t result = 0LL;
  __int16 v5 = v3 - 1;
  *(_WORD *)(v2 + 74) = v5;
  *a2 = v5;
  return result;
}

uint64_t os_packet_get_aggregation_type(uint64_t a1)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  return *(unsigned __int8 *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x64);
}

uint64_t os_packet_set_tx_timestamp(uint64_t result, uint64_t a2)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  unint64_t v2 = result & 0xFFFFFFFFFFFFFFF0LL;
  *(void *)(v2 + 136) = a2;
  *(void *)(v2 + 104) = *(void *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x68) | 0x1000000000000LL;
  return result;
}

uint64_t os_copy_and_inet_checksum( uint32x4_t *a1, uint32x4_t *a2, uint64_t a3, unint64_t a4, int8x16_t a5, int8x16_t a6, __n128 a7, uint64x2_t a8)
{
  unsigned int v8 = os_cpu_copy_in_cksum(a1, a2, a3, a4, a5, a6, a7, a8);
  unsigned int v9 = ((HIWORD(v8) + (unsigned __int16)v8) >> 16) + (unsigned __int16)(HIWORD(v8) + v8);
  return (unsigned __int16)~(v9 + HIWORD(v9));
}

uint64_t os_buflet_get_data_offset(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t os_buflet_get_data_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t os_buflet_set_data_offset(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 32) = a2;
  return 0LL;
}

uint64_t os_buflet_set_data_length(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 36) = a2;
  return 0LL;
}

uint64_t os_buflet_get_object_address(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t os_buflet_get_object_limit(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t os_buflet_get_data_address(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t os_buflet_get_data_limit(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t os_packet_get_trace_id(uint64_t a1)
{
  if ((a1 & 3) == 2) {
    return *(unsigned int *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x60);
  }
  else {
    return 0LL;
  }
}

uint64_t os_packet_set_trace_id(uint64_t result, int a2)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(_DWORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x60) = a2;
  return result;
}

uint64_t os_packet_trace_event( uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  unsigned int v9 = (void *)*(unsigned int *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x60);
  uint64_t result = kdebug_is_enabled((uint64_t)a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result) {
    return __kdebug_trace64(a2, v9, 0LL, 0LL, 0LL, v11, v12, v13);
  }
  return result;
}

uint64_t os_packet_set_protocol_segment_size(uint64_t a1, __int16 a2)
{
  if ((a1 & 3) != 2) {
    pkt_type_assert_fail(a1);
  }
  *(_WORD *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x66) = a2;
  return 0LL;
}

uint64_t os_packet_set_tso_flags(uint64_t result, int a2)
{
  if ((result & 3) != 2) {
    pkt_type_assert_fail(result);
  }
  *(_DWORD *)((result & 0xFFFFFFFFFFFFFFF0LL) + 0x54) |= a2 & 0x300000;
  return result;
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return clonefileat(-2, a1, -2, a2, a3);
}

int reboot(int a1)
{
  return __reboot(a1);
}

uint64_t _mach_continuous_time(uint64_t *a1, void *a2)
{
  do
  {
    uint64_t v5 = MEMORY[0xFFFFFC098];
    uint64_t result = mach_absolute_time();
  }

  while (v5 != MEMORY[0xFFFFFC098]);
  if (a1) {
    *a1 = result;
  }
  if (a2) {
    *a2 = v5 + result;
  }
  return result;
}

uint64_t mach_continuous_time(void)
{
  if (MEMORY[0xFFFFFC091])
  {
    if (MEMORY[0xFFFFFC090] == 3)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 4, 15, 10, 6));
    }

    else if (MEMORY[0xFFFFFC090] == 2)
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 14, 0, 6));
    }

    else
    {
      __isb(0xFu);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 14, 0, 2));
    }

    return MEMORY[0xFFFFFC0A8] + StatusReg;
  }

  else
  {
    _mach_continuous_time(0LL, &v2);
    return v2;
  }

uint64_t mach_continuous_approximate_time(void)
{
  uint64_t v0 = MEMORY[0xFFFFFC098];
  if (MEMORY[0xFFFFFC0C8]) {
    uint64_t v1 = MEMORY[0xFFFFFC0C0];
  }
  else {
    uint64_t v1 = mach_absolute_time();
  }
  return v1 + v0;
}

int unlinkat(int a1, const char *a2, int a3)
{
  int result = __unlinkat(a1, a2, a3);
  if (!result)
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v4 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

kern_return_t clock_sleep(mach_port_t a1, int a2, mach_timespec_t a3, mach_timespec_t *a4)
{
  return clock_sleep_trap(a1, a2, a3.tv_sec, a3.tv_nsec, a4);
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  int result = __renameat(a1, a2, a3, a4);
  if (!result)
  {
    do
      unsigned int v5 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v5 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

uint64_t internal_catch_exception_raise_state_identity( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))internal_catch_exception_raise_state_identity_exc_raise_state_identity_func;
  if (internal_catch_exception_raise_state_identity_exc_raise_state_identity_func == (_UNKNOWN *)-1LL && _dlsym != 0LL)
  {
    unsigned int v22 = a2;
    uint64_t v14 = a8;
    uint64_t v15 = a7;
    uint64_t v16 = a6;
    uint64_t v17 = a5;
    uint64_t v18 = a4;
    uint64_t v19 = a3;
    uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dlsym(-2LL, "catch_exception_raise_state_identity");
    a2 = v22;
    a3 = v19;
    a4 = v18;
    a5 = v17;
    a6 = v16;
    a7 = v15;
    a8 = v14;
    uint64_t v12 = v20;
    internal_catch_exception_raise_state_identity_exc_raise_state_identity_func = v20;
  }

  if (!v12) {
    abort();
  }
  return v12(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t internal_catch_exception_raise_state( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = internal_catch_exception_raise_state_exc_raise_state_func;
  if (internal_catch_exception_raise_state_exc_raise_state_func == (_UNKNOWN *)-1LL && _dlsym != 0LL)
  {
    uint64_t v17 = (void *)_dlsym(-2LL, "catch_exception_raise_state");
    internal_catch_exception_raise_state_exc_raise_state_func = v17;
  }

  if (!v17) {
    abort();
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v17)( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9);
}

uint64_t internal_catch_exception_raise( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = internal_catch_exception_raise_exc_raise_func;
  if (internal_catch_exception_raise_exc_raise_func == (_UNKNOWN *)-1LL && _dlsym != 0LL)
  {
    uint64_t v12 = (void *)_dlsym(-2LL, "catch_exception_raise");
    internal_catch_exception_raise_exc_raise_func = v12;
  }

  if (!v12) {
    abort();
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v12)(a1, a2, a3, a4, a5, a6);
}

size_t fprintf_stderr( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12 = (unsigned int *)&a9;
  size_t v9 = _mach_vsnprintf(__buf, 1024, (unsigned __int8 *)a1, v12);
  write(2, __buf, v9);
  return v9;
}

uint64_t guarded_open_dprotected_np( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8, unsigned int a9)
{
  else {
    unint64_t v9 = 0LL;
  }
  return __guarded_open_dprotected_np(a1, a2, a3, a4, a5, a6, (void *)v9, a8);
}

kern_return_t host_get_atm_diagnostic_flag(host_t host, uint32_t *diagnostic_flag)
{
  *diagnostic_flag = MEMORY[0xFFFFFC104];
  return 0;
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  *multiuser_flags = MEMORY[0xFFFFFC108];
  return 0;
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  *multiuser_mode = MEMORY[0xFFFFFC108] >> 31;
  return 0;
}

kern_return_t host_create_mach_voucher( host_t host, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t recipesCnt, ipc_voucher_t *voucher)
{
  kern_return_t result;
  size_t v5 = *(void *)&recipesCnt;
  int result = host_create_mach_voucher_trap(host, recipes, recipesCnt, voucher);
  if (result == 268435459) {
    return _kernelrpc_host_create_mach_voucher(host, recipes, v5, voucher);
  }
  return result;
}

char *__cdecl mach_error_type(mach_error_t error_value)
{
  unsigned int v15 = error_value;
  do_compat((int *)&v15);
  unint64_t v1 = (unint64_t)v15 >> 26;
  uint64_t v2 = &_mach_errors[5 * (v15 >> 26)];
  unsigned int v3 = (v15 >> 14) & 0xFFF;
  signed int v4 = v3;
  if ((_DWORD)v1 == 56)
  {
    signed int v4 = 0;
    uint64_t v5 = 2LL;
    unsigned int v6 = (unsigned int *)(v2[3] + 4LL);
    int result = "(?/?)";
    while (1)
    {
      unsigned int v8 = *(v6 - 1);
      unsigned int v9 = *v6;
      int v10 = v3 - v8;
      BOOL v11 = v3 >= v8 && v9 >= v3;
      BOOL v12 = !v11;
      int v13 = v9 - v8;
      int v14 = v12 ? v13 + 1 : v10;
      v4 += v14;
      if (!v12) {
        break;
      }
      v6 += 2;
      if (!--v5) {
        return result;
      }
    }
  }

  if (v4 >= *(_DWORD *)v2) {
    return "(?/?)";
  }
  else {
    return *(char **)(_mach_errors[5 * v1 + 2] + 40LL * v4);
  }
}

int *do_compat(int *result)
{
  int v1 = *result;
  if ((*result + 199) > 0x63)
  {
    unsigned int v3 = v1 + 299;
    unsigned int v4 = v1 - 1000;
    unsigned int v5 = v1 - 1600;
    else {
      int v6 = (v1 - 27600) | 0x8008000;
    }
    int v7 = v5 | 0x8004000;
    if (v5 > 0x63) {
      int v7 = v6;
    }
    if (v4 <= 0x63) {
      int v8 = v4 | 0x8000000;
    }
    else {
      int v8 = v7;
    }
    else {
      int v9 = v8;
    }
    int v2 = (-200 - v1) | 0xC004000;
    if (v3 > 0x63) {
      int v2 = v9;
    }
  }

  else
  {
    int v2 = (-100 - v1) | 0xC000000;
  }

  *int result = v2;
  return result;
}

const char *mach_error_string_int(unsigned int a1, _DWORD *a2)
{
  unsigned int v33 = a1;
  do_compat((int *)&v33);
  __int16 v3 = v33;
  unint64_t v4 = (unint64_t)v33 >> 26;
  unsigned int v5 = (char *)&_mach_errors[5 * v4];
  unsigned int v6 = (v33 >> 14) & 0xFFF;
  *a2 = 1;
  signed int v7 = v6;
  if ((_DWORD)v4 == 56)
  {
    signed int v7 = 0;
    uint64_t v8 = 2LL;
    int v9 = (unsigned int *)(*((void *)v5 + 3) + 4LL);
    while (1)
    {
      unsigned int v10 = *(v9 - 1);
      unsigned int v11 = *v9;
      int v12 = v6 - v10;
      BOOL v13 = v6 >= v10 && v11 >= v6;
      BOOL v14 = !v13;
      int v15 = v11 - v10;
      int v16 = v14 ? v15 + 1 : v12;
      v7 += v16;
      if (!v14) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        goto LABEL_31;
      }
    }
  }

  if (v7 >= *(_DWORD *)v5)
  {
LABEL_31:
    char v32 = (char *)&_mach_errors[5 * v4 + 1];
    return *(const char **)v32;
  }

  unsigned int v17 = v3 & 0x3FFF;
  uint64_t v18 = _mach_errors[5 * v4 + 2];
  signed int v19 = v7;
  uint64_t v20 = *(void *)(v18 + 40LL * v7 + 24);
  if (v20)
  {
    uint64_t v21 = *(unsigned int *)(v18 + 40LL * v7 + 32);
    signed int v22 = 0;
    __int16 v23 = (unsigned int *)(v20 + 4);
    int result = "unknown error code";
    while (1)
    {
      unsigned int v25 = *(v23 - 1);
      unsigned int v26 = *v23;
      int v27 = v17 - v25;
      BOOL v28 = v17 >= v25 && v26 >= v17;
      BOOL v29 = !v28;
      int v30 = v26 - v25;
      int v31 = v29 ? v30 + 1 : v27;
      v22 += v31;
      if (!v29) {
        break;
      }
      v23 += 2;
      if (!--v21) {
        return result;
      }
    }
  }

  else
  {
    signed int v22 = v17;
  }

  if (v22 < *(_DWORD *)(v18 + 40LL * v19 + 8))
  {
    *a2 = mach_error_full_diag;
    char v32 = (char *)(*(void *)(v18 + 40LL * v19 + 16) + 8LL * v22);
    return *(const char **)v32;
  }

  return "unknown error code";
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)mach_error_string_int(error_value, &v2);
}

void mach_error(const char *str, mach_error_t error_value)
{
  if (v17)
  {
    unsigned int v11 = mach_error_type(error_value);
    _mach_snprintf(v18, 1024, "%s %s (%x)", v12, v13, v14, v15, v16, v11);
  }

  fprintf_stderr("%s %s\n", v4, v5, v6, v7, v8, v9, v10, (uint64_t)str);
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  *a2 = vm_kernel_page_size;
  return 0;
}

uint64_t mach_init()
{
  if ((mach_init_mach_init_inited & 1) == 0)
  {
    mach_init_doit();
    mach_init_mach_init_inited = 1;
  }

  return 0LL;
}

uint64_t mach_init_doit()
{
  mach_task_self_ = task_self_trap();
  uint64_t result = mach_reply_port();
  _task_reply_port = result;
  if (!vm_kernel_page_shift)
  {
    vm_kernel_page_shift = MEMORY[0xFFFFF4037];
    vm_kernel_page_size = 1 << MEMORY[0xFFFFF4037];
    vm_kernel_page_mask = vm_kernel_page_size - 1;
  }

  if (!vm_page_shift)
  {
    vm_page_shift = MEMORY[0xFFFFF4025];
    vm_page_size = 1 << MEMORY[0xFFFFF4025];
    vm_page_mask = vm_page_size - 1;
  }

  return result;
}

uint64_t _mach_fork_child()
{
  return 0LL;
}

int64_t exclaves_endpoint_call(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  if (a4 != 512) {
    return 4LL;
  }
  *a3 = *a5;
  int64_t result = _exclaves_ctl_trap(a1, (void *)0x1000000, a2, a3, (void *)0x200, 0LL, 0LL, 0LL);
  *a5 = *a3;
  *a6 = a3[63];
  return result;
}

int64_t exclaves_outbound_buffer_create(void *a1, void *a2, void *a3, void *a4)
{
  return _exclaves_ctl_trap(a1, (void *)0x2000000, a2, a4, a3, (void *)1, 0LL, 0LL);
}

int64_t exclaves_outbound_buffer_copyout(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return _exclaves_ctl_trap(a1, (void *)0x4000000, a4, a2, a3, a5, a6, 0LL);
}

int64_t exclaves_inbound_buffer_create(void *a1, void *a2, void *a3, void *a4)
{
  return _exclaves_ctl_trap(a1, (void *)0x2000000, a2, a4, a3, (void *)2, 0LL, 0LL);
}

int64_t exclaves_inbound_buffer_copyin(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return _exclaves_ctl_trap(a1, (void *)0x3000000, a4, a2, a3, a5, a6, 0LL);
}

uint64_t exclaves_named_buffer_create()
{
  return 46LL;
}

uint64_t exclaves_named_buffer_copyin()
{
  return 46LL;
}

uint64_t exclaves_named_buffer_copyout()
{
  return 46LL;
}

int64_t exclaves_launch_conclave(void *a1, uint64_t a2, uint64_t a3)
{
  int64_t result = 4LL;
  if (!a2 && !a3) {
    return _exclaves_ctl_trap(a1, (void *)0x6000000, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  return result;
}

int64_t exclaves_lookup_service(void *a1, uint64_t a2, void *a3)
{
  uint64_t v7 = 0LL;
  int64_t result = _exclaves_ctl_trap(a1, (void *)0x7000000, 0LL, v6, (void *)0x98, 0LL, 0LL, 0LL);
  if (a3)
  {
    if (!(_DWORD)result) {
      *a3 = v8;
    }
  }

  return result;
}

int64_t exclaves_boot(void *a1, unsigned int a2)
{
  return _exclaves_ctl_trap(a1, (void *)0x5000000, (void *)a2, 0LL, 0LL, 0LL, 0LL, 0LL);
}

int64_t exclaves_audio_buffer_create(void *a1, void *a2, void *a3, void *a4)
{
  return _exclaves_ctl_trap(a1, (void *)0x8000000, a2, a4, a3, 0LL, 0LL, 0LL);
}

int64_t exclaves_audio_buffer_copyout(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return _exclaves_ctl_trap(a1, (void *)0x9000000, a4, a2, a3, a5, a6, 0LL);
}

int64_t exclaves_audio_buffer_copyout_with_status( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  return _exclaves_ctl_trap(a1, (void *)0x9000000, a4, a2, a3, a5, a6, a7);
}

int64_t exclaves_sensor_create(void *a1, void *a2, void *a3)
{
  return _exclaves_ctl_trap(a1, (void *)0xA000000, a2, a3, 0LL, 0LL, 0LL, 0LL);
}

int64_t exclaves_sensor_start(void *a1, void *a2, void *a3)
{
  return _exclaves_ctl_trap(a1, (void *)0xB000000, a2, a3, 0LL, 0LL, 0LL, 0LL);
}

int64_t exclaves_sensor_stop(void *a1, void *a2, void *a3)
{
  return _exclaves_ctl_trap(a1, (void *)0xC000000, a2, a3, 0LL, 0LL, 0LL, 0LL);
}

int64_t exclaves_sensor_status(void *a1, void *a2, void *a3)
{
  return _exclaves_ctl_trap(a1, (void *)0xD000000, a2, a3, 0LL, 0LL, 0LL, 0LL);
}

int64_t exclaves_notification_create(void *a1, uint64_t a2, void *a3)
{
  int64_t result = 4LL;
  if (a2 && a3)
  {
    (*((void (**)(_BYTE *))_libkernel_string_functions + 11))(v6);
    int64_t result = _exclaves_ctl_trap(a1, (void *)0xE000000, 0LL, v6, (void *)0x98, 0LL, 0LL, 0LL);
    if (!(_DWORD)result) {
      *a3 = v7;
    }
  }

  return result;
}

int64_t mach_msg2_internal( void *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v16 = (void *)(a2 & 0xFFFFFFFFFFFFFBBFLL);
  int64_t result = mach_msg2_trap(a1, (void *)(a2 & 0xFFFFFFFFFFFFFBBFLL), a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    if ((a2 & 0x40) == 0)
    {
      while ((_DWORD)result == 268435463)
        int64_t result = mach_msg2_trap(a1, v16, a3, a4, a5, a6, a7, a8);
    }

    if ((a2 & 0x400) == 0 && (_DWORD)result == 268451845)
    {
      if ((~(_BYTE)a2 & 3) != 0) {
        unint64_t v18 = a2;
      }
      else {
        unint64_t v18 = a2 & 0xFFFFFFFFFFFFBBBELL;
      }
      signed int v19 = (void *)(v18 & 0xFFFFFFFFFFFFFBBELL);
      do
        int64_t result = mach_msg2_trap(a1, v19, (void *)a3, a4, a5, a6, a7, a8);
      while ((_DWORD)result == 268451845);
    }
  }

  return result;
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return mach_msg_overwrite(msg, option, send_size, rcv_size, rcv_name, timeout, notify, 0LL, v8);
}

mach_msg_return_t mach_msg_overwrite( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify, mach_msg_header_t *rcv_msg, mach_msg_size_t rcv_limit)
{
  uint64_t v12 = *(void *)&rcv_name;
  uint64_t v14 = *(void *)&send_size;
  uint64_t v16 = option;
  int v17 = v42;
  if ((~(_WORD)option & 0x802) == 0 && _libkernel_voucher_functions[5])
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v17 = *(_BYTE **)(StatusReg + 984);
    if (v17)
    {
      uint64_t v16 = option | 0x100000000LL;
    }

    else
    {
      __int128 v37 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
      if (!v37 || (v41 = *(void *)&rcv_name, v38 = option | 0x100000000LL, v39 = v37(128LL), uint64_t v12 = v41, !v39))
      {
        v16 &= ~0x100000000uLL;
LABEL_2:
        int v17 = v42;
        goto LABEL_7;
      }

      uint64_t v40 = v38;
      int v17 = (_BYTE *)v39;
      *(void *)(StatusReg + 984) = v39;
      uint64_t v16 = v40;
    }
  }

LABEL_7:
  uint64_t v19 = v16 | 0x100000000LL;
  if (rcv_msg != 0LL && (v16 & 2) != 0) {
    v16 |= 0x100000000uLL;
  }
  if ((v16 & 1) != 0
    && (unint64_t)*_libkernel_voucher_functions >= 3
    && (uint64_t v20 = (uint64_t (*)(_BYTE *, uint64_t))_libkernel_voucher_functions[5]) != 0LL)
  {
    uint64_t v21 = v12;
    int v22 = v20(v17, 128LL);
    uint64_t v12 = v21;
    if (v22)
    {
      if ((v19 & 0x100000000LL) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }

  else
  {
    int v22 = 0;
  }

  uint64_t v19 = v16;
  if ((v16 & 0x100000000LL) != 0)
  {
LABEL_14:
    v43[0] = msg;
    v43[1] = rcv_msg;
    int v44 = v14;
    mach_msg_size_t v45 = rcv_size;
    unint64_t v46 = v17;
    uint64_t v47 = 0LL;
    int v48 = v22;
    int v49 = 128;
  }

    if (v16 == v13[1])
    {
      else {
        return 6LL;
      }
    }

    uint64_t v20 = &a1[24 * v11];
    int v22 = *((void *)v20 + 12);
    uint64_t v21 = v20 + 24;
    uint64_t v23 = v22 + 8LL * v16;
    if ((*(_WORD *)(v23 + 4) & 1) != 0
      || (unsigned int v26 = **(unsigned int **)&a1[24 * v11 + 20], (v26 & 0x80000000) == 0))
    {
      int v24 = *(void *)&a1[24 * v11 + 34];
      unsigned int v25 = (uint64_t *)(v24 + *(_DWORD *)v23 * *((unsigned __int16 *)v13 + 12));
      int v27 = *v25;
      mach_msg_size_t v8 = (unint64_t)(v25 + 2);
      unsigned int v26 = v27;
      if (v27 == ((v8 - v24) ^ __os_ch_md_redzone_cookie)) {
        break;
      }
    }

    else
    {
      qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
      __break(1u);
    }

    qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
    qword_18C50D158 = v26;
    __break(1u);
LABEL_55:
    ;
  }

  BOOL v28 = &a1[24 * v11];
  *a2 = v8 & 0xFFFFFFFFFFFFFFF0LL | v28[26] & 3LL | (4 * (v28[27] & 3LL));
  *(_DWORD *)uint64_t v23 = -1;
  *(_WORD *)(*v21 + 8LL * v16 + 4) &= ~1u;
  uint64_t v29 = *v14;
  if (v28[26] == 2)
  {
    uint64_t v30 = *(unsigned __int16 *)(v8 + 154);
    int v31 = *(unsigned __int16 *)(v8 + 152);
    if (*(_WORD *)(v8 + 154)) {
      char v32 = (_DWORD)v31 == 0;
    }
    else {
      char v32 = 1;
    }
    if (!v32)
    {
      if (a1[24 * v11 + 40] >= v31)
      {
        if (v30 <= v31)
        {
          if (*(_DWORD *)(v8 + 52) != -1)
          {
            unsigned int v33 = (void *)(v8 + 32);
LABEL_19:
            mach_msg_size_t v8 = 0LL;
            uint64_t v34 = &a1[24 * v11];
            uint64_t v35 = v34 + 32;
            __int128 v36 = v34 + 30;
            __int128 v37 = v34 + 38;
            uint64_t v38 = v33;
            do
            {
              uint64_t v39 = *((_DWORD *)v38 + 5);
              if (v39 == -1)
              {
                int v44 = 0LL;
              }

              else
              {
                uint64_t v40 = *((_WORD *)v38 + 20);
                uint64_t v41 = (v40 & 2) == 0;
                if ((v40 & 2) != 0) {
                  uint64x2_t v42 = 20LL;
                }
                else {
                  uint64x2_t v42 = 16LL;
                }
                if (v41) {
                  uint32x4_t v43 = v36;
                }
                else {
                  uint32x4_t v43 = v35;
                }
                int v44 = *v43 + (*(_DWORD *)(v29 + v42) * v39);
              }

              v38[1] = v44;
              mach_msg_size_t v45 = *((_DWORD *)v38 + 6);
              if (v45 == -1)
              {
                *uint64_t v38 = 0LL;
                uint64_t v29 = (v8 + 1);
                if ((_DWORD)v29 != (_DWORD)v30) {
                  goto LABEL_66;
                }
                goto LABEL_37;
              }

              unint64_t v46 = (void *)(*v37 + v45 * *(unsigned __int16 *)(v29 + 26));
              *uint64_t v38 = v46;
              mach_msg_size_t v8 = (v8 + 1);
              uint64_t v38 = v46;
            }

            while (v46);
            uint64_t v30 = **(unsigned int **)&a1[24 * v11 + 20];
            if ((v30 & 0x80000000) != 0) {
              goto LABEL_67;
            }
            return 6LL;
          }

mach_msg_return_t mach_msg_send(mach_msg_header_t *a1)
{
  return mach_msg_overwrite(a1, 1, a1->msgh_size, 0, 0, 0, 0, 0LL, v2);
}

mach_msg_return_t mach_msg_receive(mach_msg_header_t *a1)
{
  return mach_msg_overwrite(a1, 2, 0, a1->msgh_size, a1->msgh_local_port, 0, 0, 0LL, v2);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  mach_msg_bits_t msgh_bits = a1->msgh_bits;
  mach_msg_destroy_port(a1->msgh_remote_port, a1->msgh_bits & 0x1F);
  mach_msg_destroy_port(a1->msgh_voucher_port, HIWORD(msgh_bits) & 0x1F);
  if ((msgh_bits & 0x80000000) != 0)
  {
    mach_msg_bits_t v3 = a1[1].msgh_bits;
    if (v3)
    {
      int v4 = 0;
      p_msgh_size = &a1[1].msgh_size;
      do
      {
        mach_msg_size_t v6 = p_msgh_size[2];
        switch(HIBYTE(v6))
        {
          case 0u:
            mach_msg_size_t v7 = *p_msgh_size;
            p_msgh_size += 3;
            mach_msg_destroy_port(v7, BYTE2(v6));
            break;
          case 1u:
            if (p_msgh_size[2])
            {
              mach_vm_size_t v8 = p_msgh_size[3];
              if ((_DWORD)v8) {
                goto LABEL_17;
              }
            }

            goto LABEL_21;
          case 2u:
            if (p_msgh_size[3])
            {
              uint64_t v9 = 0LL;
              mach_vm_address_t v10 = *(void *)p_msgh_size;
              do
              {
                mach_msg_destroy_port(*(unsigned int *)(v10 + 4 * v9), *((unsigned __int8 *)p_msgh_size + 10));
                unint64_t v11 = p_msgh_size[3];
                ++v9;
              }

              while (v11 > v9);
              if (p_msgh_size[3] && *((_BYTE *)p_msgh_size + 8) != 0)
              {
                mach_vm_size_t v8 = 4 * v11;
LABEL_17:
                mach_vm_deallocate(mach_task_self_, *(void *)p_msgh_size, v8);
              }
            }

            goto LABEL_21;
          case 3u:
            goto LABEL_21;
          case 4u:
            if ((v6 & 2) == 0)
            {
              mach_port_unguard(mach_task_self_, p_msgh_size[3], *(void *)p_msgh_size);
              mach_msg_size_t v6 = p_msgh_size[2];
            }

            mach_msg_destroy_port(p_msgh_size[3], BYTE2(v6));
LABEL_21:
            p_msgh_size += 4;
            break;
          default:
            break;
        }

        ++v4;
      }

      while (v4 != v3);
    }
  }

uint64_t mach_msg_destroy_port(uint64_t name, int a2)
{
  mach_port_name_t namea = name;
  if ((name - 1) <= 0xFFFFFFFD)
  {
    mach_port_name_t v2 = name;
    switch(a2)
    {
      case 16:
        return mach_port_mod_refs(mach_task_self_, name, 1u, -1);
      case 17:
      case 18:
        mach_port_t v3 = mach_task_self_;
        goto LABEL_7;
      case 20:
        mach_port_insert_right(mach_task_self_, name, name, 0x14u);
        mach_port_t v3 = mach_task_self_;
LABEL_7:
        mach_port_name_t v4 = v2;
        goto LABEL_9;
      case 21:
        _kernelrpc_mach_port_extract_right(mach_task_self_, name, 0x15u, &namea, &v5);
        mach_port_t v3 = mach_task_self_;
        mach_port_name_t v4 = namea;
LABEL_9:
        name = mach_port_deallocate(v3, v4);
        break;
      default:
        return name;
    }
  }

  return name;
}

mach_msg_return_t mach_msg_server_once( BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  mach_msg_return_t v15;
  vm_size_t v16;
  mach_msg_size_t v17;
  mach_vm_size_t v18;
  kern_return_t v19;
  mach_msg_return_t v20;
  mach_vm_size_t v21;
  mach_vm_address_t v22;
  uint64_t v23;
  uint64_t (*v24)(mach_msg_header_t *);
  mach_port_t msgh_remote_port;
  int v26;
  mach_msg_return_t v27;
  void (*v29)(uint64_t);
  mach_msg_size_t v31;
  unsigned int v32;
  mach_msg_header_t *v33;
  mach_vm_size_t size;
  mach_vm_address_t address;
  mach_msg_size_t v6 = *(mach_msg_header_t **)&a2;
  mach_port_t v8 = mach_task_self_;
  unsigned int v9 = HIBYTE(a4) & 0xF;
  if (v9 > 4) {
    int v10 = 68;
  }
  else {
    int v10 = dword_1801F7058[v9];
  }
  int v11 = vm_page_size - 1;
  uint64_t v12 = -(uint64_t)vm_page_size;
  mach_msg_size_t v13 = a2 + 68;
  if ((a4 & 0x20000) == 0) {
    mach_msg_size_t v13 = a2;
  }
  mach_vm_size_t v14 = v12 & (v11 + v13);
  uint64_t v15 = mach_vm_allocate(mach_task_self_, &address, v14, 335544321);
  if (v15) {
    return v15;
  }
  size = v14;
  unsigned int v33 = (mach_msg_header_t *)address;
  LODWORD(v16) = (v11 + v10 + (_DWORD)v6) & v12;
  if ((a4 & 4) != 0) {
    int v17 = (v11 + v10 + (_DWORD)v6) & v12;
  }
  else {
    int v17 = v10 + (_DWORD)v6;
  }
  char v32 = a4 & 0xFFFFF7FC;
  while (1)
  {
    unint64_t v18 = v16;
    address = (mach_vm_address_t)v6;
    uint64_t v19 = mach_vm_allocate(v8, &address, v16, 335544321);
    if (v19)
    {
      uint64_t v15 = v19;
      int v22 = (mach_vm_address_t)v33;
      uint64_t v21 = size;
      goto LABEL_39;
    }

    mach_msg_size_t v6 = (mach_msg_header_t *)address;
    uint64_t v20 = mach_msg_overwrite((mach_msg_header_t *)address, a4 & 0xFFFFF7FC | 0x802, 0, v17, a3, 0, 0, 0LL, v31);
    uint64_t v15 = v20;
    if ((a4 & 4) == 0 || v20 != 268451844) {
      break;
    }
    uint64_t v16 = (vm_page_size + 0xFFFFFFFF + v6->msgh_size + v10) & -(uint64_t)vm_page_size;
    mach_vm_deallocate(v8, (mach_vm_address_t)v6, v18);
    int v17 = v16;
  }

  int v22 = (mach_vm_address_t)v33;
  if (v20)
  {
    uint64_t v23 = -1LL;
    goto LABEL_36;
  }

  int v24 = (uint64_t (*)(mach_msg_header_t *))_libkernel_voucher_functions[3];
  if (v24) {
    uint64_t v23 = v24(v6);
  }
  else {
    uint64_t v23 = -1LL;
  }
  ((void (*)(mach_msg_header_t *, mach_msg_header_t *))a1)(v6, v33);
  if ((v33->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v33[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v33->msgh_remote_port = 0;
      }

      else
      {
        v6->msgh_remote_port = 0;
        mach_msg_destroy(v6);
      }
    }
  }

  if (!v33->msgh_remote_port) {
    goto LABEL_35;
  }
  if ((v33->msgh_bits & 0x1F) == 0x12) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = 17;
  }
  int v27 = mach_msg_overwrite(v33, v26 | v32, v33->msgh_size, 0, 0, 0, 0, 0LL, v31);
  if ((v27 - 268435459) <= 4 && ((1 << (v27 - 3)) & 0x13) != 0)
  {
    mach_msg_server_consume_unsent_message(v33);
LABEL_35:
    uint64_t v15 = 0;
    goto LABEL_36;
  }

  uint64_t v15 = v27;
LABEL_36:
  uint64_t v29 = (void (*)(uint64_t))_libkernel_voucher_functions[4];
  if (v29) {
    v29(v23);
  }
  mach_vm_deallocate(v8, (mach_vm_address_t)v6, v18);
  uint64_t v21 = size;
LABEL_39:
  mach_vm_deallocate(v8, v22, v21);
  return v15;
}

void mach_msg_server_consume_unsent_message(mach_msg_header_t *a1)
{
  mach_port_name_t msgh_local_port = a1->msgh_local_port;
  if (msgh_local_port - 1 <= 0xFFFFFFFD && ((a1->msgh_bits >> 8) & 0x1F) - 17 <= 1)
  {
    mach_port_deallocate(mach_task_self_, msgh_local_port);
    a1->mach_port_name_t msgh_local_port = 0;
  }

  mach_msg_destroy(a1);
}

mach_msg_return_t mach_msg_server( BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  mach_msg_return_t v15;
  unsigned int v16;
  mach_vm_address_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  mach_msg_size_t v21;
  kern_return_t v22;
  uint64_t v23;
  uint64_t (*v24)(mach_msg_header_t *);
  uint64_t v25;
  int v26;
  int v27;
  mach_msg_header_t *v28;
  mach_msg_header_t *v29;
  mach_vm_address_t v30;
  mach_msg_return_t v31;
  void (*v33)(uint64_t);
  void (*v34)(uint64_t);
  unsigned int v35;
  mach_msg_size_t v37;
  int v38;
  int v39;
  mach_vm_size_t v40;
  vm_map_t target;
  mach_msg_options_t v42;
  unsigned int size;
  mach_msg_option_t size_4;
  BOOLean_t (__cdecl *v45)(mach_msg_header_t *, mach_msg_header_t *);
  mach_vm_address_t address;
  mach_port_t v8 = mach_task_self_;
  mach_msg_size_t v9 = a2 + 68;
  if ((a4 & 0x20000) != 0) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a2;
  }
  int v11 = (mach_msg_header_t *)&unk_18C440000;
  vm_size_t v12 = v10 + 0xFFFFFFFFLL + vm_page_size;
  uint64_t v13 = v12 & -(uint64_t)vm_page_size;
  mach_vm_size_t v14 = v12 & -(int)vm_page_size;
  uint64_t v15 = mach_vm_allocate(mach_task_self_, &address, v14, 335544321);
  if (v15) {
    return v15;
  }
  mach_msg_size_t v45 = a1;
  uint64_t v40 = v14;
  uint64_t v16 = a4 & 0xFFFFF7FC;
  int v17 = address;
  unint64_t v18 = HIBYTE(a4) & 0xF;
  if (v18 <= 4)
  {
    uint64_t v38 = dword_1801F7058[v18];
    mach_msg_size_t v9 = v38 + a2;
  }

  uint64_t v19 = 0;
  uint64_t v20 = (vm_page_size + v9 - 1) & -(int)vm_page_size;
  target = v8;
  uint64x2_t v42 = a4;
  if ((a4 & 4) != 0) {
    uint64_t v21 = (vm_page_size + v9 - 1) & -(int)vm_page_size;
  }
  else {
    uint64_t v21 = v9;
  }
  size_4 = v16 | 0x802;
  while (1)
  {
    if (v19 >= v20)
    {
      uint64_t v23 = v13;
      size = v19;
      goto LABEL_15;
    }

    address = (mach_vm_address_t)v11;
    int v22 = mach_vm_allocate(v8, &address, v20, 335544321);
    if (v22) {
      break;
    }
    size = v20;
    uint64_t v23 = v13;
    int v11 = (mach_msg_header_t *)address;
LABEL_15:
    uint64_t v15 = mach_msg_overwrite(v11, size_4, 0, v21, a3, 0, 0, 0LL, v37);
    while (!v15)
    {
      int v24 = (uint64_t (*)(mach_msg_header_t *))_libkernel_voucher_functions[3];
      if (v24) {
        unsigned int v25 = v24(v11);
      }
      else {
        unsigned int v25 = -1LL;
      }
      *(void *)int v17 = 0LL;
      *(void *)(v17 + 8) = 0LL;
      *(void *)(v17 + 16) = 0LL;
      ((void (*)(mach_msg_header_t *, mach_vm_address_t))v45)(v11, v17);
      if ((*(_DWORD *)v17 & 0x80000000) == 0)
      {
        unsigned int v26 = *(_DWORD *)(v17 + 32);
        if (v26)
        {
          if (v26 == -305)
          {
            *(_DWORD *)(v17 + 8) = 0;
          }

          else
          {
            v11->msgh_remote_port = 0;
            mach_msg_destroy(v11);
          }
        }
      }

      if (!*(_DWORD *)(v17 + 8)) {
        goto LABEL_47;
      }
      if ((*(_DWORD *)v17 & 0x1F) == 0x12) {
        int v27 = 2307;
      }
      else {
        int v27 = 2323;
      }
      if (size == (_DWORD)v23) {
        BOOL v28 = 0LL;
      }
      else {
        BOOL v28 = v11;
      }
      if (size == (_DWORD)v23) {
        uint64_t v29 = (mach_msg_header_t *)v17;
      }
      else {
        uint64_t v29 = v11;
      }
      if (size == (_DWORD)v23) {
        uint64_t v30 = (mach_vm_address_t)v11;
      }
      else {
        uint64_t v30 = v17;
      }
      int v31 = mach_msg_overwrite((mach_msg_header_t *)v17, v27 | v42, *(_DWORD *)(v17 + 4), v21, a3, 0, 0, v28, v37);
      if ((v31 - 268435459) <= 4 && ((1 << (v31 - 3)) & 0x13) != 0)
      {
        mach_msg_server_consume_unsent_message((mach_msg_header_t *)v17);
LABEL_46:
        int v11 = v29;
        int v17 = v30;
LABEL_47:
        uint64_t v34 = (void (*)(uint64_t))_libkernel_voucher_functions[4];
        if (v34) {
          v34(v25);
        }
        goto LABEL_15;
      }

      uint64_t v15 = v31;
      if (v31 == 268451843) {
        goto LABEL_46;
      }
      unsigned int v33 = (void (*)(uint64_t))_libkernel_voucher_functions[4];
      int v11 = v29;
      int v17 = v30;
      if (v33)
      {
        v33(v25);
        int v11 = v29;
        int v17 = v30;
      }
    }

    mach_port_t v8 = target;
    if (v15 != 268451844)
    {
      uint64_t v35 = size;
LABEL_53:
      mach_vm_deallocate(target, (mach_vm_address_t)v11, v35);
      goto LABEL_54;
    }

    uint64_t v35 = size;
    if ((v42 & 4) == 0)
    {
      uint64_t v15 = 268451844;
      goto LABEL_53;
    }

    uint64_t v13 = v23;
    uint64_t v21 = (vm_page_size + v11->msgh_size + v39 - 1) & -(int)vm_page_size;
    mach_vm_deallocate(target, (mach_vm_address_t)v11, size);
    uint64_t v19 = size;
    uint64_t v20 = v21;
  }

  uint64_t v15 = v22;
LABEL_54:
  mach_vm_deallocate(v8, v17, v40);
  return v15;
}

kern_return_t mach_voucher_deallocate(mach_port_name_t voucher)
{
  return mach_port_deallocate(mach_task_self_, voucher);
}

BOOL mach_msg_priority_is_pthread_priority(char a1)
{
  return a1 == -1;
}

uint64_t mach_msg_priority_encode(int a1, int a2, __int16 a3)
{
  int v3 = ((a3 << 8) - 256) & 0xFF00 | (a2 << 16);
  else {
    unsigned int v4 = a1 << 20;
  }
  return v3 | v4;
}

uint64_t mach_msg_priority_overide_qos(unsigned int a1)
{
  unsigned int v1 = (a1 >> 20) & 0xF;
  if (v1 >= 7) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t mach_msg_priority_qos(unsigned int a1)
{
  unsigned int v1 = HIWORD(a1) & 0xF;
  if (v1 >= 7) {
    return 0LL;
  }
  else {
    return v1;
  }
}

uint64_t mach_msg_priority_relpri(unsigned int a1)
{
  if ((HIWORD(a1) & 0xF) - 7 >= 0xFFFFFFFA) {
    return (((__int16)a1 >> 8) + 1);
  }
  else {
    return 0LL;
  }
}

void mig_allocate(vm_address_t *a1, vm_size_t a2)
{
  kern_return_t v3;
  mach_vm_address_t address;
  address = *a1;
  int v3 = mach_vm_allocate(mach_task_self_, &address, a2, 335544321);
  *a1 = address;
  if (v3) {
    *a1 = 0LL;
  }
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

uint64_t __commpage_gettimeofday(uint64_t a1)
{
  return __commpage_gettimeofday_internal(a1, 0LL);
}

uint64_t __commpage_gettimeofday_internal(uint64_t a1, uint64_t *a2)
{
  do
  {
    uint64_t v4 = MEMORY[0xFFFFFC120];
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = MEMORY[0xFFFFFC130];
  }

  while (v4 != MEMORY[0xFFFFFC120]);
  if (!v4) {
    return 1LL;
  }
  uint64_t v7 = v5 - v4;
  uint64_t v8 = 1LL;
  if (v5 - v4 < MEMORY[0xFFFFFC140] && (MEMORY[0xFFFFFC128] & 0x8000000000000000LL) == 0)
  {
    uint64_t v9 = MEMORY[0xFFFFFC138] * v7;
    *(void *)a1 = ((MEMORY[0xFFFFFC138] * (unsigned __int128)v7) >> 64)
                  + __CFADD__(MEMORY[0xFFFFFC138] * v7, MEMORY[0xFFFFFC130])
                  + MEMORY[0xFFFFFC128];
    *(_DWORD *)(a1 + 8) = (1000000 * ((v9 + v6) >> 32)) >> 32;
    uint64_t v8 = 0LL;
    if (a2) {
      *a2 = v5;
    }
  }

  return v8;
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  a2->mach_msg_bits_t msgh_bits = (a1->msgh_bits >> 8) & 0x1F;
  a2->msgh_size = 36;
  a2->msgh_remote_port = a1->msgh_local_port;
  a2->mach_port_name_t msgh_local_port = 0;
  a2->uint64_t msgh_id = a1->msgh_id + 100;
  *(NDR_record_t *)&a2[1].mach_msg_bits_t msgh_bits = NDR_record;
}

mach_port_t mig_get_reply_port(void)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  mach_port_t result = *(_DWORD *)(StatusReg + 16);
  mach_port_name_t name = result;
  if (!result)
  {
    v2.reserved[1] = 0LL;
    *(_OWORD *)&v2.flags = xmmword_1801F7070;
    mach_port_t result = mach_port_construct(mach_task_self_, &v2, 0LL, &name);
    if (result)
    {
      qword_18C50D128 = (uint64_t)"mach_port_construct for mig_get_reply_port failed";
      qword_18C50D158 = (int)result;
      __break(1u);
    }

    else
    {
      mach_port_t result = name;
      *(void *)(StatusReg + 16) = name;
    }
  }

  return result;
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  mach_port_name_t v2 = *(_DWORD *)(StatusReg + 16);
  if (v2 && _task_reply_port != v2)
  {
    *(void *)(StatusReg + 16) = _task_reply_port;
    mach_port_mod_refs(mach_task_self_, v2, 1u, -1);
    if (v2 != reply_port) {
      mach_port_deallocate(mach_task_self_, reply_port);
    }
    *(void *)(StatusReg + 16) = 0LL;
  }

int mig_strncpy(char *dest, const char *src, int len)
{
  if (len < 1) {
    return 0;
  }
  if (len == 1)
  {
LABEL_7:
    *dest = 0;
  }

  else
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      int v4 = src[v3];
      dest[v3] = v4;
      if (!v4) {
        return v3 + 1;
      }
      if (len - 1 == (_DWORD)++v3)
      {
        dest += v3;
        goto LABEL_7;
      }
    }
  }

  return len;
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  int v3 = 0;
  if (dest && len >= 1)
  {
    BOOL v4 = src == 0LL;
    if (len < 2)
    {
      int v6 = 0;
    }

    else
    {
      uint64_t v5 = 0LL;
      int v6 = 0;
      do
      {
        uint64_t v7 = v5 + 1;
        if (v4)
        {
          char v8 = 0;
          BOOL v4 = 1;
        }

        else
        {
          int v9 = *(unsigned __int8 *)src++;
          char v8 = v9;
          BOOL v4 = v9 == 0;
          if (!v9) {
            int v6 = v5 + 1;
          }
        }

        dest[v5++] = v8;
      }

      while (len - 1 != (_DWORD)v7);
      dest += v7;
    }

    *dest = 0;
    if (v4) {
      return v6;
    }
    else {
      return len;
    }
  }

  return v3;
}

void panic_init(mach_port_t a1)
{
  master_host_port = a1;
}

void panic(const char *a1, ...)
{
  size_t v6 = _mach_snprintf(__buf, 1024, "panic: %s\n", v1, v2, v3, v4, v5, a1);
  write(2, __buf, v6);
  host_reboot(master_host_port, 4096);
  abort();
}

void port_obj_init(int a1)
{
  kern_return_t v1;
  mach_vm_address_t address;
  address = (mach_vm_address_t)port_obj_table;
  uint64_t v1 = mach_vm_allocate(mach_task_self_, &address, 16LL * a1, 1);
  port_obj_table = (port_obj_tentry *)address;
  if (v1) {
    panic("port_obj_init: can't vm_allocate");
  }
}

kern_return_t semaphore_timedwait(semaphore_t semaphore, mach_timespec_t wait_time)
{
  return semaphore_timedwait_trap(semaphore, wait_time.tv_sec, wait_time.tv_nsec);
}

kern_return_t semaphore_timedwait_signal( semaphore_t wait_semaphore, semaphore_t signal_semaphore, mach_timespec_t wait_time)
{
  return semaphore_timedwait_signal_trap(wait_semaphore, signal_semaphore, wait_time.tv_sec, wait_time.tv_nsec);
}

uint64_t msg_rpc()
{
  return 5LL;
}

uint64_t msg_send()
{
  return 5LL;
}

uint64_t msg_receive()
{
  return 5LL;
}

uint64_t task_self_()
{
  return mach_task_self_;
}

uint64_t _mach_vsnprintf(_BYTE *a1, int a2, unsigned __int8 *a3, unsigned int *a4)
{
  uint64_t v4 = (a2 - 1);
  if (a2 > 1)
  {
    do
    {
      int v5 = *a3;
      if (v5 == 37)
      {
        size_t v6 = a3 + 2;
        int v7 = (char)a3[1];
        if (v7 == 120)
        {
          uint64_t v16 = a4;
          a4 += 2;
          unint64_t v17 = *v16;
          if (!(_DWORD)v17) {
            goto LABEL_26;
          }
          char v28 = 0;
          unint64_t v18 = &v28;
          do
          {
            *--unint64_t v18 = hex[v17 & 0xF];
            BOOL v13 = v17 > 0xF;
            v17 >>= 4;
          }

          while (v13);
          unsigned int v19 = 0;
          int v20 = -1;
          LODWORD(v21) = v4;
          int v22 = v18;
          do
          {
            unsigned int v23 = v19;
            uint64_t v21 = (v21 - 1);
            int v24 = *++v22;
            ++v20;
            ++v19;
          }

          while (v24);
          if ((int)v22 - (int)v18 >= 1)
          {
            uint64_t v25 = 0LL;
            do
            {
              a1[v25] = v18[v25];
              ++v25;
            }

            while (v23 + 1LL != v25);
            a1 += v25;
          }

          else
          {
LABEL_26:
            uint64_t v21 = v4;
          }

          uint64_t v4 = v21;
        }

        else if (v7 == 115)
        {
          char v8 = (char **)a4;
          a4 += 2;
          int v9 = *v8;
          if (v9)
          {
            uint64_t v10 = v9 - 1;
            while (*++v10)
              ;
            int v12 = (_DWORD)v10 - (_DWORD)v9;
            BOOL v13 = v12 < 1 || (int)v4 < 1;
            if (!v13)
            {
              do
              {
                char v14 = *v9++;
                *a1++ = v14;
                uint64_t v15 = (v4 - 1);
                --v12;
                BOOL v13 = v4 > 1;
                LODWORD(v4) = v4 - 1;
              }

              while (v13);
              uint64_t v4 = v15;
            }
          }
        }
      }

      else
      {
        if (!*a3) {
          break;
        }
        size_t v6 = a3 + 1;
        *a1++ = v5;
        uint64_t v4 = (v4 - 1);
      }

      a3 = v6;
    }

    while ((int)v4 > 0);
  }

  if (a2 >= 1) {
    *a1 = 0;
  }
  return (~(_DWORD)v4 + a2);
}

uint64_t _mach_snprintf( _BYTE *a1, int a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  return _mach_vsnprintf(a1, a2, a3, &a9);
}

int getiopolicy_np(int a1, int a2)
{
  v11[0] = a2;
  v11[1] = a1;
  int v8 = __iopolicysys((void *)1, v11, v2, v3, v4, v5, v6, v7);
  if (!v8) {
    return v11[2];
  }
  int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    int v9 = &errno;
  }
  *int v9 = v8;
  return -1;
}

int setiopolicy_np(int a1, int a2, int a3)
{
  v10[0] = a2;
  v10[1] = a1;
  v10[2] = a3;
  int result = __iopolicysys((void *)2, v10, *(void **)&a3, v3, v4, v5, v6, v7);
  if (result == -2)
  {
    if (*(void *)_libkernel_functions >= 3uLL)
    {
      int v9 = *(void (**)(void))(_libkernel_functions + 88);
      if (v9) {
        v9(0LL);
      }
    }

    return 0;
  }

  return result;
}

uint64_t pselect_DARWIN_EXTSN_NOCANCEL( void *a1, void *a2, void *a3, void *a4, uint64_t *a5, void *a6, void *a7, void *a8)
{
  int v9 = a5;
  uint64_t v17 = __pselect_nocancel(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v17 == -1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v19 = *(int **)(StatusReg + 8);
    if (!v19) {
      unsigned int v19 = &errno;
    }
    if (*v19 == 78)
    {
      if (v9)
      {
        uint64_t v20 = v9[1];
        uint64_t v28 = *v9;
        int v29 = (int)v20 / 1000;
        int v9 = &v28;
      }

      if (a6)
      {
        uint64_t v17 = __pthread_sigmask(3, (const sigset_t *)a6, &v30);
        if (!(_DWORD)v17)
        {
          uint64_t v17 = select_DARWIN_EXTSN_NOCANCEL(a1, a2, a3, a4, v9, v21, v22, v23);
          int v24 = *(int **)(StatusReg + 8);
          if (!v24) {
            int v24 = &errno;
          }
          int v25 = *v24;
          __pthread_sigmask(3, &v30, 0LL);
          unsigned int v26 = *(int **)(StatusReg + 8);
          if (!v26) {
            unsigned int v26 = &errno;
          }
          *unsigned int v26 = v25;
        }
      }

      else
      {
        return select_DARWIN_EXTSN_NOCANCEL(a1, a2, a3, a4, v9, v14, v15, v16);
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v17;
}

int *__error(void)
{
  uint64_t v0 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (v0) {
    return v0;
  }
  else {
    return &errno;
  }
}

uint64_t cerror_nocancel(int a1)
{
  errno = a1;
  uint64_t v1 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (v1) {
    *uint64_t v1 = a1;
  }
  return -1LL;
}

uint64_t cerror(int a1)
{
  return -1LL;
}

uint64_t mach_right_recv_construct(unsigned int a1, mach_port_name_t *a2, mach_port_context_t a3)
{
  mach_port_name_t name = 0;
  *(_OWORD *)&v5.flags = xmmword_1801F7088;
  v5.reserved[1] = 0LL;
  if ((a1 & 7) != 0) {
    v5.flags = ((a1 & 1) == 0LL) | (32 * ((a1 >> 1) & 1)) & 0xFFFFFF7F | (((a1 >> 2) & 1) << 7);
  }
  if (a2)
  {
    v5.flags = ((a1 & 1) == 0LL) | (32 * ((a1 >> 1) & 1)) & 0xFFFFFF7F | (((a1 >> 2) & 1) << 7) | 0x10;
    uint64_t result = mach_port_construct(mach_task_self_, &v5, a3, &name);
    if (!(_DWORD)result)
    {
      uint64_t result = name;
      *a2 = name;
      return result;
    }

    goto LABEL_9;
  }

  uint64_t result = mach_port_construct(mach_task_self_, &v5, a3, &name);
  if ((_DWORD)result)
  {
LABEL_9:
    qword_18C50D128 = (uint64_t)"construct recv right failed";
    qword_18C50D158 = (int)result;
    __break(1u);
    return result;
  }

  return name;
}

uint64_t mach_right_recv_destruct(uint64_t name, unsigned int *a2, mach_port_context_t guard)
{
  if (a2)
  {
    uint64_t v4 = *a2;
    if ((_DWORD)v4 != (_DWORD)name) {
      goto LABEL_7;
    }
    mach_port_delta_t v5 = -1;
  }

  else
  {
    mach_port_delta_t v5 = 0;
  }

  mach_port_name_t name = mach_port_destruct(mach_task_self_, name, v5, guard);
  if (!(_DWORD)name) {
    return name;
  }
  uint64_t v4 = (int)name;
  qword_18C50D128 = (uint64_t)"destruct recv right failed";
  qword_18C50D158 = (int)name;
  __break(1u);
LABEL_7:
  qword_18C50D128 = (uint64_t)"api misuse: bad send right";
  qword_18C50D158 = v4;
  __break(1u);
  return name;
}

uint64_t mach_right_send_create(uint64_t name)
{
  uint64_t result = mach_port_insert_right(mach_task_self_, name, name, 0x14u);
  if (!(_DWORD)result) {
    return name;
  }
  qword_18C50D128 = (uint64_t)"create send right failed";
  qword_18C50D158 = (int)result;
  __break(1u);
  return result;
}

uint64_t mach_right_send_retain(uint64_t name)
{
  uint64_t v1 = name;
  uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, 1);
  if (!(_DWORD)result) {
    return v1;
  }
  if ((_DWORD)result == 17) {
    return 0xFFFFFFFFLL;
  }
  qword_18C50D128 = (uint64_t)"retain send right failed";
  qword_18C50D158 = (int)result;
  __break(1u);
  return result;
}

uint64_t mach_right_send_release(mach_port_name_t name)
{
  uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, -1);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 17)
    {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 4u, -1);
      if (!(_DWORD)result) {
        return result;
      }
    }

    else
    {
      qword_18C50D128 = (uint64_t)"release send right failed";
      qword_18C50D158 = (int)result;
      __break(1u);
    }

    qword_18C50D128 = (uint64_t)"release dead name failed";
    qword_18C50D158 = (int)result;
    __break(1u);
  }

  return result;
}

uint64_t mach_right_send_once_create(unsigned int a1)
{
  unsigned int v2 = 0;
  uint64_t result = _kernelrpc_mach_port_extract_right(mach_task_self_, a1, 0x15u, &v2, &v3);
  if (!(_DWORD)result) {
    return v2;
  }
  qword_18C50D128 = (uint64_t)"create send-once right failed";
  qword_18C50D158 = (int)result;
  __break(1u);
  return result;
}

uint64_t mach_right_send_once_consume(mach_port_name_t name)
{
  uint64_t result = mach_port_mod_refs(mach_task_self_, name, 2u, -1);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 17)
    {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 4u, -1);
      if (!(_DWORD)result) {
        return result;
      }
    }

    else
    {
      qword_18C50D128 = (uint64_t)"consume send-once right failed";
      qword_18C50D158 = (int)result;
      __break(1u);
    }

    qword_18C50D128 = (uint64_t)"release dead name failed";
    qword_18C50D158 = (int)result;
    __break(1u);
  }

  return result;
}

uint64_t mach_vm_reclaim_ringbuffer_init(uint64_t a1)
{
  vm_size_t v1 = vm_page_size;
  kAccountingThreshold = vm_page_size;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 8) = (v1 - 32) >> 4;
  return mach_vm_deferred_reclamation_buffer_init(mach_task_self_, (uint64_t *)a1, v1);
}

uint64_t mach_vm_reclaim_mark_free(uint64_t a1, unint64_t a2, unsigned int a3, uint64_t a4, char *a5)
{
  uint64_t v6 = a3;
  unint64_t v7 = a3 | (unint64_t)(a4 << 32);
  int v8 = *(unint64_t **)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *a5 = 0;
  uint64_t v10 = v8 + 1;
  unint64_t v11 = v8[1];
  unint64_t v12 = *v8;
  unint64_t v13 = (v11 + 1) % v9;
  while (v13 == v12 % v9)
  {
    uint64_t result = mach_vm_deferred_reclamation_buffer_synchronize(mach_task_self_, v9 - 1);
    if ((_DWORD)result)
    {
      qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_free failed";
      qword_18C50D158 = (int)result;
      __break(1u);
      return result;
    }

    unint64_t v12 = *v8;
    if (v13 == *v8 % v9)
    {
      qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_free failed";
      qword_18C50D158 = v12;
      __break(1u);
      break;
    }
  }

  uint64_t v15 = &v8[2 * (v11 % v9)];
  v15[4] = a2;
  v15[5] = v7;
  __dmb(0xBu);
  do
    unint64_t v16 = __ldxr(v10);
  while (__stxr(v16 + 1, v10));
  unint64_t v17 = *(void *)(a1 + 24);
  unint64_t v18 = *(void *)(a1 + 16) + v6;
  *(void *)(a1 + 16) = v18;
  if (v18 > v17 && v18 - v17 > kAccountingThreshold
    || (BOOL v19 = v17 > v18, v20 = v17 - v18, v19) && v20 > kAccountingThreshold)
  {
    *(void *)(a1 + 24) = v18;
    char v21 = 1;
  }

  else
  {
    char v21 = 0;
  }

  *a5 = v21;
  return v11;
}

uint64_t mach_vm_reclaim_mark_free_with_id( uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, char *a6)
{
  if (a5 == -1LL) {
    return 4LL;
  }
  unint64_t v7 = *(void **)result;
  unint64_t v6 = *(void *)(result + 8);
  if (**(void **)result > a5) {
    return 5LL;
  }
  unint64_t v8 = v7[1];
  if (v8 <= a5)
  {
    qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_free_with_id failed";
    qword_18C50D158 = v8;
    __break(1u);
LABEL_19:
    qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_free_with_id failed";
    qword_18C50D158 = v6;
    __break(1u);
    return result;
  }

  v7[1] = a5;
  __dmb(0xBu);
  if (v7[2] > a5)
  {
    v7[1] = v8;
    return 5LL;
  }

  uint64_t v9 = (uint64_t)&v7[2 * (a5 % v6) + 4];
  unint64_t v6 = *(void *)v9;
  if (*(void *)v9 || *(_DWORD *)(v9 + 8)) {
    goto LABEL_19;
  }
  *(void *)uint64_t v9 = a2;
  *(void *)(v9 + 8) = a3 | (unint64_t)(a4 << 32);
  __dmb(0xBu);
  v7[1] = v8;
  unint64_t v10 = *(void *)(result + 24);
  unint64_t v11 = *(void *)(result + 16) + a3;
  *(void *)(result + 16) = v11;
  if (v11 > v10 && v11 - v10 > kAccountingThreshold
    || (BOOL v12 = v10 > v11, v13 = v10 - v11, v12) && v13 > kAccountingThreshold)
  {
    *(void *)(result + 24) = v11;
    char v14 = 1;
  }

  else
  {
    char v14 = 0;
  }

  uint64_t result = 0LL;
  *a6 = v14;
  return result;
}

uint64_t mach_vm_reclaim_mark_used(uint64_t result, unint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2 == -1LL) {
    return 1LL;
  }
  mach_port_delta_t v5 = *(void **)result;
  unint64_t v4 = *(void *)(result + 8);
  if (**(void **)result > a2) {
    return 0LL;
  }
  unint64_t v6 = v5[1];
  if (v6 > a2)
  {
    v5[1] = a2;
    __dmb(0xBu);
    if (v5[2] > a2)
    {
      uint64_t result = 0LL;
      v5[1] = v6;
      return result;
    }

    uint64_t v7 = (uint64_t)&v5[2 * (a2 % v4) + 4];
    unint64_t v4 = *(void *)v7;
    if (*(_DWORD *)(v7 + 8) != a4 || v4 != a3) {
      goto LABEL_20;
    }
    *(void *)uint64_t v7 = 0LL;
    *(void *)(v7 + 8) = 0LL;
    __dmb(0xBu);
    v5[1] = v6;
    unint64_t v9 = *(void *)(result + 24);
    unint64_t v10 = *(void *)(result + 16) - a4;
    *(void *)(result + 16) = v10;
    if (v10 > v9 && v10 - v9 > kAccountingThreshold
      || (BOOL v11 = v9 > v10, v12 = v9 - v10, v11) && v12 > kAccountingThreshold)
    {
      *(void *)(result + 24) = v10;
    }

    return 1LL;
  }

  qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_used failed";
  qword_18C50D158 = v6;
  __break(1u);
LABEL_20:
  qword_18C50D128 = (uint64_t)"mach_vm_reclaim_mark_used failed";
  qword_18C50D158 = v4;
  __break(1u);
  return result;
}

uint64_t mach_vm_reclaim_update_kernel_accounting(uint64_t a1)
{
  return mach_vm_deferred_reclamation_buffer_update_reclaimable_bytes(mach_task_self_, *(void *)(a1 + 16));
}

BOOL mach_vm_reclaim_is_available(uint64_t a1, unint64_t a2)
{
  return a2 == -1LL || *(void *)(*(void *)a1 + 16LL) <= a2;
}

BOOL mach_vm_reclaim_is_reclaimed(unint64_t **a1, unint64_t a2)
{
  return a2 != -1LL && **a1 > a2;
}

uint64_t mach_vm_reclaim_synchronize(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return mach_vm_deferred_reclamation_buffer_synchronize(mach_task_self_, a2);
  }
  else {
    return 4LL;
  }
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  int result = __proc_info((void *)1, *(void **)&type, *(void **)&typeinfo, 0LL, buffer, *(void **)&buffersize, v4, v5);
  if (result == -1) {
    return 0;
  }
  return result;
}

int proc_listallpids(void *buffer, int buffersize)
{
  int v4 = __proc_info((void *)1, (void *)1, 0LL, 0LL, buffer, *(void **)&buffersize, v2, v3);
  if (v4 == -1) {
    return 0;
  }
  else {
    return v4 >> 2;
  }
}

int proc_listpgrppids(pid_t pgrpid, void *buffer, int buffersize)
{
  int v5 = __proc_info((void *)1, (void *)2, *(void **)&pgrpid, 0LL, buffer, *(void **)&buffersize, v3, v4);
  if (v5 == -1) {
    return 0;
  }
  else {
    return v5 >> 2;
  }
}

int proc_listchildpids(pid_t ppid, void *buffer, int buffersize)
{
  int v5 = __proc_info((void *)1, (void *)6, *(void **)&ppid, 0LL, buffer, *(void **)&buffersize, v3, v4);
  if (v5 == -1) {
    return 0;
  }
  else {
    return v5 >> 2;
  }
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  int result = __proc_info((void *)2, *(void **)&pid, *(void **)&flavor, (void *)arg, buffer, *(void **)&buffersize, v5, v6);
  if (result == -1) {
    return 0;
  }
  return result;
}

uint64_t proc_pidoriginatorinfo(void *a1, void *a2, void *a3)
{
  unint64_t v6 = (void *)getpid();
  LODWORD(result) = __proc_info((void *)0xA, v6, a1, 0LL, a2, a3, v7, v8);
  if ((_DWORD)result == -1) {
    return 0LL;
  }
  else {
    return result;
  }
}

uint64_t proc_listcoalitions( void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  LODWORD(result) = __proc_info((void *)0xB, a1, a2, 0LL, a3, a4, a7, a8);
  if ((_DWORD)result == -1) {
    return 0LL;
  }
  else {
    return result;
  }
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return __proc_info((void *)9, *(void **)&pid, *(void **)&flavor, 0LL, buffer, 0LL, v3, v4);
}

uint64_t proc_setthread_cpupercent( unsigned int a1, unsigned int a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1 <= 0x63 && !HIBYTE(a2)) {
    return proc_rlimit_control((void *)0xFFFFFFFFLL, (void *)3, (void *)(a1 | (a2 << 8)), a4, a5, a6, a7, a8);
  }
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  *unint64_t v9 = 22;
  return 0xFFFFFFFFLL;
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  int result = __proc_info((void *)3, *(void **)&pid, *(void **)&flavor, (void *)fd, buffer, *(void **)&buffersize, v5, v6);
  if (result == -1) {
    return 0;
  }
  return result;
}

int proc_pidfileportinfo(int pid, uint32_t fileport, int flavor, void *buffer, int buffersize)
{
  int result = __proc_info( (void *)6,  *(void **)&pid,  *(void **)&flavor,  (void *)fileport,  buffer,  *(void **)&buffersize,  v5,  v6);
  if (result == -1) {
    return 0;
  }
  return result;
}

uint64_t proc_piddynkqueueinfo( void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8)
{
  LODWORD(result) = __proc_info((void *)0xD, a1, a2, a3, a4, a5, a7, a8);
  if ((_DWORD)result == -1) {
    return 0LL;
  }
  else {
    return result;
  }
}

int proc_udata_info(int pid, int flavor, void *buffer, int buffersize)
{
  return __proc_info((void *)0xE, *(void **)&pid, *(void **)&flavor, 0LL, buffer, *(void **)&buffersize, v4, v5);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  if (buffersize > 0x1F)
  {
    if (__proc_info((void *)2, *(void **)&pid, (void *)3, 0LL, v9, (void *)0x88, v3, v4) + 1 >= 2)
    {
      if ((_BYTE)v11)
      {
        __int128 v8 = v12;
        *(_OWORD *)buffer = v11;
        *((_OWORD *)buffer + 1) = v8;
      }

      else
      {
        *(_OWORD *)buffer = v10;
      }

      return (*((uint64_t (**)(void *))_libkernel_string_functions + 12))(buffer);
    }

    else
    {
      return 0;
    }
  }

  else
  {
    int result = 0;
    unint64_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      unint64_t v6 = &errno;
    }
    int *v6 = 12;
  }

  return result;
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  if (buffersize > 0x3FF)
  {
    if (__proc_info( (void *)2,  *(void **)&pid,  (void *)0x1F,  (void *)address,  &v10,  (void *)0x410,  v4,  v5)
       + 1 >= 2)
      return (*((uint64_t (**)(void *, uint64_t *, void))_libkernel_string_functions + 11))( buffer,  &v11,  buffersize);
    else {
      return 0;
    }
  }

  else
  {
    int result = 0;
    __int128 v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      __int128 v8 = &errno;
    }
    *__int128 v8 = 12;
  }

  return result;
}

int proc_kmsgbuf(void *buffer, uint32_t buffersize)
{
  int result = __proc_info((void *)4, 0LL, 0LL, 0LL, buffer, *(void **)&buffersize, v2, v3);
  if (result == -1) {
    return 0;
  }
  return result;
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  if (buffersize <= 0x3FF)
  {
    int result = 0;
    unint64_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      unint64_t v6 = &errno;
    }
    int v7 = 12;
LABEL_9:
    int *v6 = v7;
    return result;
  }

  if (buffersize > 0x1000)
  {
    int result = 0;
    unint64_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      unint64_t v6 = &errno;
    }
    int v7 = 84;
    goto LABEL_9;
  }

  else {
    return (*((uint64_t (**)(void *))_libkernel_string_functions + 12))(buffer);
  }
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  if (buffersize <= 0x3FF)
  {
    int result = 0;
    int v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v4) {
      int v4 = &errno;
    }
    int v5 = 12;
LABEL_9:
    int *v4 = v5;
    return result;
  }

  if (buffersize > 0x1000)
  {
    int result = 0;
    int v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v4) {
      int v4 = &errno;
    }
    int v5 = 84;
    goto LABEL_9;
  }

  if (__proc_info_extended_id( (void *)2,  (void *)audittoken->val[5],  (void *)0xB,  (void *)1,  (void *)(int)audittoken->val[7],  0LL,  buffer,  *(void **)&buffersize) == -1) {
    return 0;
  }
  else {
    return (*((uint64_t (**)(void *))_libkernel_string_functions + 12))(buffer);
  }
}

uint64_t proc_current_thread_schedinfo(void *a1, unint64_t a2)
{
  if (a2 < 8)
  {
    int v2 = 12;
LABEL_7:
    unint64_t v16 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v16) {
      unint64_t v16 = &errno;
    }
    *unint64_t v16 = v2;
    goto LABEL_10;
  }

  if (a2 != 8)
  {
    int v2 = 84;
    goto LABEL_7;
  }

  int v4 = (void *)getpid();
  __int128 v12 = (void *)__thread_selfid(v4, v5, v6, v7, v8, v9, v10, v11);
LABEL_10:
  unint64_t v17 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v17) {
    unint64_t v17 = &errno;
  }
  return *v17;
}

int proc_libversion(int *major, int *minor)
{
  if (major) {
    *major = 1;
  }
  if (minor) {
    *minor = 1;
  }
  return 0;
}

int proc_setpcontrol(const int control)
{
  unsigned int v3 = (void *)getpid();
  int v6 = __proc_info((void *)5, v3, (void *)1, (void *)control, 0LL, 0LL, v4, v5);
  int result = 0;
  if (v6 == -1)
  {
    int v7 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v7) {
      int v7 = &errno;
    }
    return *v7;
  }

  return result;
}

int proc_track_dirty(pid_t pid, uint32_t flags)
{
  int v4 = __proc_info((void *)8, *(void **)&pid, (void *)1, (void *)flags, 0LL, 0LL, v2, v3);
  int result = 0;
  if (v4 == -1)
  {
    int v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      int v6 = &errno;
    }
    return *v6;
  }

  return result;
}

int proc_set_dirty(pid_t pid, BOOL dirty)
{
  int v4 = __proc_info((void *)8, *(void **)&pid, (void *)2, (void *)dirty, 0LL, 0LL, v2, v3);
  int result = 0;
  if (v4 == -1)
  {
    int v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      int v6 = &errno;
    }
    return *v6;
  }

  return result;
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  if (!flags) {
    return 22;
  }
  uint32_t v5 = __proc_info((void *)8, *(void **)&pid, (void *)3, 0LL, 0LL, 0LL, v2, v3);
  if (v5 == -1)
  {
    __int128 v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      __int128 v8 = &errno;
    }
    return *v8;
  }

  else
  {
    uint32_t v6 = v5;
    int result = 0;
    *flags = v6;
  }

  return result;
}

int proc_clear_dirty(pid_t pid, uint32_t flags)
{
  int v4 = __proc_info((void *)8, *(void **)&pid, (void *)4, (void *)flags, 0LL, 0LL, v2, v3);
  int result = 0;
  if (v4 == -1)
  {
    uint32_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      uint32_t v6 = &errno;
    }
    return *v6;
  }

  return result;
}

int proc_terminate(pid_t pid, int *sig)
{
  if (!sig) {
    return 22;
  }
  int v5 = __proc_info((void *)7, *(void **)&pid, 0LL, 0LL, 0LL, 0LL, v2, v3);
  if (v5 == -1)
  {
    __int128 v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      __int128 v8 = &errno;
    }
    return *v8;
  }

  else
  {
    int v6 = v5;
    int result = 0;
    *sig = v6;
  }

  return result;
}

uint64_t proc_signal_delegate( _OWORD *a1, _OWORD *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  __int128 v8 = a1[1];
  v13[0] = *a1;
  v13[1] = v8;
  __int128 v9 = a2[1];
  v13[2] = *a2;
  v13[3] = v9;
  int v10 = __proc_info((void *)0x13, 0LL, a3, 0LL, v13, (void *)0x40, a7, a8);
  uint64_t result = 0LL;
  if (v10 == -1)
  {
    __int128 v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      __int128 v12 = &errno;
    }
    return *v12;
  }

  return result;
}

uint64_t proc_terminate_delegate( _OWORD *a1, _OWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  __int128 v8 = a1[1];
  v15[0] = *a1;
  v15[1] = v8;
  __int128 v9 = a2[1];
  v15[2] = *a2;
  v15[3] = v9;
  if (!a3) {
    return 22LL;
  }
  int v11 = __proc_info((void *)0x14, 0LL, 0LL, 0LL, v15, (void *)0x40, a7, a8);
  if (v11 == -1)
  {
    char v14 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v14) {
      char v14 = &errno;
    }
    return *v14;
  }

  else
  {
    int v12 = v11;
    uint64_t result = 0LL;
    *a3 = v12;
  }

  return result;
}

uint64_t proc_signal_with_audittoken( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  int v8 = __proc_info((void *)0x11, 0LL, a2, 0LL, a1, (void *)0x20, a7, a8);
  uint64_t result = 0LL;
  if (v8 == -1)
  {
    int v10 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v10) {
      int v10 = &errno;
    }
    return *v10;
  }

  return result;
}

uint64_t proc_terminate_with_audittoken( void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  if (!a2) {
    return 22LL;
  }
  int v9 = __proc_info((void *)0x12, 0LL, 0LL, 0LL, a1, (void *)0x20, a7, a8);
  if (v9 == -1)
  {
    int v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      int v12 = &errno;
    }
    return *v12;
  }

  else
  {
    int v10 = v9;
    uint64_t result = 0LL;
    *a2 = v10;
  }

  return result;
}

int proc_terminate_all_rsr(int sig)
{
  if (sig != 15 && sig != 9) {
    return 22;
  }
  int v3 = __proc_info((void *)0x10, 0LL, 0LL, (void *)sig, 0LL, 0LL, v1, v2);
  int result = 0;
  if (v3 == -1)
  {
    int v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v5) {
      int v5 = &errno;
    }
    return *v5;
  }

  return result;
}

uint64_t proc_set_cpumon_params( void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v9[0] = 5;
  v9[1] = a2;
  uint64_t v10 = a3;
  uint64_t v11 = 0LL;
  return __process_policy((void *)1, (void *)0xA, (void *)4, (void *)3, v9, a1, 0LL, a8);
}

uint64_t proc_get_cpumon_params( void *a1, _DWORD *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t result = __process_policy((void *)1, (void *)0xB, (void *)4, (void *)3, v16, a1, 0LL, a8);
  BOOL v11 = result == 0;
  BOOL v12 = v16[0] == 5;
  BOOL v13 = !v11 || !v12;
  if (v11 && v12) {
    int v14 = v16[1];
  }
  else {
    int v14 = 0;
  }
  if (v13) {
    int v15 = 0;
  }
  else {
    int v15 = v16[2];
  }
  *a2 = v14;
  *a3 = v15;
  return result;
}

uint64_t proc_set_cpumon_defaults( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v9[0] = 0xFE00000005LL;
  v9[1] = 0LL;
  _DWORD v9[2] = 0LL;
  return __process_policy((void *)1, (void *)0xA, (void *)4, (void *)3, v9, a1, 0LL, a8);
}

uint64_t proc_resume_cpumon( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  return __process_policy((void *)1, (void *)5, (void *)4, (void *)3, 0LL, a1, 0LL, a8);
}

uint64_t proc_disable_cpumon( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v9[0] = 0xFF00000005LL;
  v9[1] = 0LL;
  _DWORD v9[2] = 0LL;
  return __process_policy((void *)1, (void *)0xA, (void *)4, (void *)3, v9, a1, 0LL, a8);
}

uint64_t proc_set_cpumon_params_fatal( void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (a2 < 1 || a3 <= 0)
  {
    BOOL v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      BOOL v12 = &errno;
    }
    int v13 = 22;
    goto LABEL_12;
  }

  if (!__process_policy((void *)1, (void *)0xB, (void *)4, (void *)3, &v22, a1, 0LL, a8)
    && (_DWORD)v22 == 5
    && *(void *)((char *)&v22 + 4))
  {
    BOOL v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      BOOL v12 = &errno;
    }
    int v13 = 16;
LABEL_12:
    *BOOL v12 = v13;
    return 0xFFFFFFFFLL;
  }

  LODWORD(v22) = 5;
  DWORD1(v22) = a2;
  *((void *)&v22 + 1) = a3;
  uint64_t v23 = 0LL;
  uint64_t v14 = __process_policy((void *)1, (void *)0xA, (void *)4, (void *)3, &v22, a1, 0LL, v11);
  if (!(_DWORD)v14)
  {
    uint64_t v14 = proc_rlimit_control(a1, (void *)2, (void *)0x1000, v16, v17, v18, v19, v20);
    if ((_DWORD)v14)
    {
      __int128 v22 = 0xFF00000005uLL;
      uint64_t v23 = 0LL;
      __process_policy((void *)1, (void *)0xA, (void *)4, (void *)3, &v22, a1, 0LL, v21);
    }
  }

  return v14;
}

uint64_t proc_set_wakemon_params( void *a1, int a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  v9[0] = 1;
  v9[1] = a2;
  return proc_rlimit_control(a1, (void *)1, v9, a4, a5, a6, a7, a8);
}

uint64_t proc_get_wakemon_params( void *a1, _DWORD *a2, _DWORD *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  v12[0] = 4;
  uint64_t result = proc_rlimit_control(a1, (void *)1, v12, a4, a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    int v11 = v12[0];
    *a2 = v12[1];
    *a3 = v11;
  }

  return result;
}

uint64_t proc_set_wakemon_defaults( void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = -4294967287LL;
  return proc_rlimit_control(a1, (void *)1, &v9, a4, a5, a6, a7, a8);
}

uint64_t proc_disable_wakemon( void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t v9 = 0xFFFFFFFF00000002LL;
  return proc_rlimit_control(a1, (void *)1, &v9, a4, a5, a6, a7, a8);
}

uint64_t proc_list_uptrs( void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  return __proc_info((void *)2, a1, (void *)0x1A, 0LL, a2, a3, a7, a8);
}

uint64_t proc_list_dynkqueueids( void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  return __proc_info((void *)2, a1, (void *)0x1B, 0LL, a2, a3, a7, a8);
}

uint64_t proc_setcpu_percentage( void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  v10[0] = a2;
  v10[1] = a3;
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_reset_footprint_interval( void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return proc_rlimit_control(a1, (void *)4, (void *)1, a4, a5, a6, a7, a8);
}

uint64_t proc_clear_cpulimits( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_setcpu_deadline( void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v10[1] = 0LL;
  v10[0] = a2;
  _DWORD v10[2] = a3;
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_setcpu_percentage_withdeadline( void *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v10[0] = a2;
  v10[1] = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = a4;
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_appstate( void *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (__process_policy((void *)1, (void *)0xB, (void *)5, (void *)1, &v11, a1, 0LL, a8) == -1)
  {
    uint64_t v10 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v10) {
      uint64_t v10 = &errno;
    }
    return *v10;
  }

  else
  {
    uint64_t result = 0LL;
    if (a2) {
      *a2 = v11;
    }
  }

  return result;
}

uint64_t proc_setappstate( void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  unsigned int v10 = a2;
  if (a2 > 4) {
    return 22LL;
  }
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_devstatusnotify(int a1)
{
  int v5 = a1;
  vm_size_t v1 = (void *)getpid();
  int v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v4) {
    int v4 = &errno;
  }
  return *v4;
}

uint64_t proc_pidbind(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  int v12 = a3;
  if (a3 != 1)
  {
    if (a3) {
      return 22LL;
    }
    a1 = (void *)getpid();
  }

  int v11 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v11) {
    int v11 = &errno;
  }
  return *v11;
}

uint64_t proc_can_use_foreground_hw( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  return __proc_info((void *)0xC, a1, 0LL, 0LL, a2, (void *)4, a7, a8);
}

uint64_t proc_donate_importance_boost()
{
  uint64_t v0 = (void *)getpid();
  uint64_t result = __process_policy((void *)1, (void *)5, (void *)6, (void *)6, 0LL, v0, 0LL, v1);
  if ((_DWORD)result)
  {
    int v3 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v3) {
      int v3 = &errno;
    }
    return *v3;
  }

  return result;
}

uint64_t proc_importance_assertion_begin_with_msg(int *a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 22LL;
  }
  int v4 = *a1;
  if ((*a1 & 0x201F0000) != 0x20000000) {
    return 5LL;
  }
  if ((v4 & 0x10000000) == 0)
  {
    uint64_t result = 0LL;
    *a1 = v4 | 0x10000000;
LABEL_11:
    *a3 = &important_boost_assertion_token;
    return result;
  }

  int v7 = (void *)getpid();
  uint64_t result = __process_policy((void *)1, (void *)0xE, (void *)7, (void *)1, 0LL, v7, 0LL, v8);
  if (!(_DWORD)result) {
    goto LABEL_11;
  }
  unint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    unint64_t v9 = &errno;
  }
  return *v9;
}

uint64_t proc_importance_assertion_complete(uint64_t result)
{
  if (result)
  {
    if ((_UNKNOWN *)result == &important_boost_assertion_token)
    {
      vm_size_t v1 = (void *)getpid();
      uint64_t result = __process_policy((void *)1, (void *)0xF, (void *)7, (void *)1, 0LL, v1, 0LL, v2);
      if ((_DWORD)result)
      {
        int v3 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        if (!v3) {
          int v3 = &errno;
        }
        return *v3;
      }
    }

    else
    {
      return 5LL;
    }
  }

  return result;
}

uint64_t proc_denap_assertion_begin_with_msg(int *a1, void *a2)
{
  return proc_importance_assertion_begin_with_msg(a1, (uint64_t)a2, a2);
}

int proc_set_no_smt(void)
{
  uint64_t v0 = (void *)getpid();
  int v2 = __process_policy((void *)1, (void *)1, (void *)8, 0LL, 0LL, v0, 0LL, v1);
  int result = 0;
  if (v2 == -1)
  {
    int v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v4) {
      int v4 = &errno;
    }
    return *v4;
  }

  return result;
}

int proc_setthread_no_smt(void)
{
  int v8 = (void *)__thread_selfid(v0, v1, v2, v3, v4, v5, v6, v7);
  int v10 = __process_policy((void *)2, (void *)1, (void *)8, 0LL, 0LL, 0LL, v8, v9);
  int result = 0;
  if (v10 == -1)
  {
    int v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      int v12 = &errno;
    }
    return *v12;
  }

  return result;
}

int proc_set_csm(uint32_t flags)
{
  if (flags > 7) {
    return 22;
  }
  char v1 = flags;
  if ((flags & 3) == 0
    || (int v2 = (void *)getpid(),
        __process_policy((void *)1, (void *)1, (void *)8, 0LL, 0LL, v2, 0LL, v3) != -1))
  {
    if ((v1 & 5) == 0) {
      return 0;
    }
    int v4 = (void *)getpid();
    int v6 = __process_policy((void *)1, (void *)1, (void *)9, 0LL, 0LL, v4, 0LL, v5);
    int result = 0;
    if (v6 != -1) {
      return result;
    }
  }

  int v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v8) {
    int v8 = &errno;
  }
  return *v8;
}

int proc_setthread_csm(uint32_t flags)
{
  if (flags > 7) {
    return 22;
  }
  char v8 = flags;
  if ((flags & 3) == 0
    || (unint64_t v9 = (void *)__thread_selfid(*(void **)&flags, v1, v2, v3, v4, v5, v6, v7),
        *(void *)&flags = __process_policy((void *)2, (void *)1, (void *)8, 0LL, 0LL, 0LL, v9, v10),
        flags != -1))
  {
    if ((v8 & 5) == 0) {
      return 0;
    }
    int v11 = (void *)__thread_selfid(*(void **)&flags, v1, v2, v3, v4, v5, v6, v7);
    int v13 = __process_policy((void *)2, (void *)1, (void *)9, 0LL, 0LL, 0LL, v11, v12);
    int result = 0;
    if (v13 != -1) {
      return result;
    }
  }

  int v15 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v15) {
    int v15 = &errno;
  }
  return *v15;
}

uint64_t mach_approximate_time(void)
{
  if (MEMORY[0xFFFFFC0C8]) {
    return MEMORY[0xFFFFFC0C0];
  }
  else {
    return mach_absolute_time();
  }
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  int result = __gethostuuid(a1, a2);
  if (result == -1)
  {
    int v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v4) {
      int v4 = &errno;
    }
    if (*v4 == 1)
    {
      if (_gethostuuid_callback) {
        return _gethostuuid_callback(a1);
      }
      *a1 = 0;
    }

    return -1;
  }

  return result;
}

uint64_t _register_gethostuuid_callback(unint64_t a1)
{
  while (!__ldaxr((unint64_t *)&_gethostuuid_callback))
  {
    if (!__stlxr(a1, (unint64_t *)&_gethostuuid_callback))
    {
      int v2 = 1;
      goto LABEL_5;
    }
  }

  int v2 = 0;
  __clrex();
LABEL_5:
  if (v2) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t mach_boottime_usec()
{
  return MEMORY[0xFFFFFC0A0];
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  if (mach_task_self_ == task) {
    return 1;
  }
  else {
    BOOL v2 = v3 == 0;
  }
  return !v2;
}

kern_return_t mach_ports_register( task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  int v8 = 0;
  uint64_t v7 = 0LL;
  if (init_port_setCnt > 3) {
    return 4;
  }
  if (init_port_setCnt)
  {
    memmove(&v7, init_port_set, 4LL * init_port_setCnt);
    int v5 = v7;
    init_port_setCnt = HIDWORD(v7);
    int v6 = v8;
  }

  else
  {
    int v6 = 0;
    int v5 = 0;
  }

  return _kernelrpc_mach_ports_register3(target_task, v5, init_port_setCnt, v6);
}

kern_return_t mach_ports_lookup( task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  kern_return_t v6;
  mach_port_t *v7;
  mach_vm_address_t address;
  address = 0LL;
  int v6 = mach_vm_allocate(target_task, &address, 0xCuLL, 1);
  if (!v6)
  {
    uint64_t v7 = (mach_port_t *)address;
    int v6 = _kernelrpc_mach_ports_lookup3(target_task, (_DWORD *)address, (_DWORD *)(address + 4), (_DWORD *)(address + 8));
    if (v6)
    {
      mach_vm_deallocate(target_task, (mach_vm_address_t)v7, 0xCuLL);
    }

    else
    {
      *init_port_set = v7;
      *init_port_setCnt = 3;
    }
  }

  return v6;
}

int nfsclnt(unint64_t request, void *argstructp)
{
  int v4 = __open("/dev/nfsclnt", 0, 0LL);
  if (v4 < 0)
  {
    int v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      int v8 = &errno;
    }
    return *v8;
  }

  else
  {
    int v5 = v4;
    int v6 = ioctl(v4, request, argstructp);
    close(v5);
    return v6;
  }

uint64_t open_NOCANCEL( void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int16 a9)
{
  else {
    unsigned __int16 v9 = 0;
  }
  return __open_nocancel(a1, a2, (void *)v9, a4, a5, a6, a7, a8);
}

uint64_t openat_NOCANCEL( void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, unsigned __int16 a9)
{
  else {
    unsigned __int16 v9 = 0;
  }
  return __openat_nocancel(a1, a2, a3, (void *)v9, a5, a6, a7, a8);
}

unint64_t mach_eventlink_signal( void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return (unint64_t)__mach_eventlink_signal(a1, a2, a3, a4, a5, a6, a7, a8) >> 56;
}

unint64_t mach_eventlink_wait_until( void *a1, void **a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t v9 = __mach_eventlink_wait_until(a1, *a2, a5, a4, a3, a6, a7, a8);
  *a2 = (void *)(v9 & 0xFFFFFFFFFFFFFFLL);
  return HIBYTE(v9);
}

unint64_t mach_eventlink_signal_wait_until( void *a1, void **a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t v9 = __mach_eventlink_signal_wait_until(a1, *a2, a3, a6, a5, a4, a7, a8);
  *a2 = (void *)(v9 & 0xFFFFFFFFFFFFFFLL);
  return HIBYTE(v9);
}

int futimens(int __fd, const timespec __times[2])
{
  if (__times)
  {
    timespec v3 = *__times;
    __n128 v4 = (__n128)__times[1];
  }

  else
  {
    timespec v3 = (timespec)times_now;
    __n128 v4 = (__n128)unk_1801F70B0;
  }

  v12[0] = (__n128)v3;
  v12[1] = v4;
  size_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  __int128 v7 = xmmword_1801F70C0;
  uint64_t v8 = 0LL;
  prepare_times_array_and_attrs(v12, v9, &v10, &v11);
  DWORD1(v7) = v5;
  return fsetattrlist(__fd, &v7, v9, v10, 0);
}

__n128 prepare_times_array_and_attrs(__n128 *a1, __n128 *a2, void *a3, _DWORD *a4)
{
  unint64_t v7 = a1->n128_u64[1];
  if (v7 == -2LL)
  {
    unint64_t v8 = a1[1].n128_u64[1];
    if (v8 == -2LL) {
      return result;
    }
  }

  else
  {
    if (v7 == -1LL)
    {
      if (a1[1].n128_u64[1] == -1LL) {
        *a4 |= 0x400u;
      }
      goto LABEL_9;
    }

    unint64_t v8 = a1[1].n128_u64[1];
  }

  if (v8 == -1LL)
  {
LABEL_9:
    __darwin_time_t tv_sec = v12.tv_sec;
    uint64_t v11 = 1000LL * v12.tv_usec;
    if (a1->n128_u64[1] == -1LL)
    {
      a1->n128_u64[0] = v12.tv_sec;
      a1->n128_u64[1] = v11;
    }

    if (a1[1].n128_u64[1] == -1LL)
    {
      a1[1].n128_u64[0] = tv_sec;
      a1[1].n128_u64[1] = v11;
    }
  }

  *a3 = 0LL;
  if (a1[1].n128_u64[1] != -2LL)
  {
    __n128 result = a1[1];
    *a2++ = result;
    *a3 += 16LL;
  }

  if (a1->n128_u64[1] != -2LL)
  {
    __n128 result = *a1;
    *a2 = *a1;
    *a3 += 16LL;
  }

  return result;
}

int utimensat(int __fd, const char *__path, const timespec __times[2], int __flag)
{
  int v15 = 0;
  if (__times)
  {
    timespec v7 = *__times;
    __n128 v8 = (__n128)__times[1];
  }

  else
  {
    timespec v7 = (timespec)times_now;
    __n128 v8 = (__n128)unk_1801F70B0;
  }

  v16[0] = (__n128)v7;
  v16[1] = v8;
  size_t v14 = 0LL;
  memset(v13, 0, sizeof(v13));
  __int128 v11 = xmmword_1801F70C0;
  uint64_t v12 = 0LL;
  prepare_times_array_and_attrs(v16, v13, &v14, &v15);
  DWORD1(v11) = v9;
  return setattrlistat(__fd, __path, &v11, v13, v14, __flag & 0x800 | (__flag >> 5) & 1 | v15);
}

kern_return_t thread_policy( thread_act_t thr_act, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, BOOLean_t set_limit)
{
  kern_return_t result;
  void (*v7)(uint64_t);
  uint64_t v5 = *(void *)&thr_act;
  __n128 result = _kernelrpc_thread_policy(thr_act, policy, base, baseCnt, set_limit);
  if (result)
  {
    if (result == 51) {
      return 0;
    }
  }

  else
  {
    if (*(void *)_libkernel_functions >= 3uLL)
    {
      timespec v7 = *(void (**)(uint64_t))(_libkernel_functions + 88);
      if (v7) {
        v7(v5);
      }
    }

    return 0;
  }

  return result;
}

kern_return_t thread_policy_set( thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  kern_return_t result;
  void (*v6)(uint64_t);
  uint64_t v4 = *(void *)&thread;
  __n128 result = _kernelrpc_thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
  if (result)
  {
    if (result == 51) {
      return 0;
    }
  }

  else
  {
    if (*(void *)_libkernel_functions >= 3uLL)
    {
      int v6 = *(void (**)(uint64_t))(_libkernel_functions + 88);
      if (v6) {
        v6(v4);
      }
    }

    return 0;
  }

  return result;
}

kern_return_t thread_set_policy( thread_act_t thr_act, processor_set_t pset, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, policy_limit_t limit, mach_msg_type_number_t limitCnt)
{
  kern_return_t result;
  void (*v9)(uint64_t);
  uint64_t v7 = *(void *)&thr_act;
  __n128 result = _kernelrpc_thread_set_policy(thr_act, pset, policy, base, baseCnt, limit, limitCnt);
  if (result)
  {
    if (result == 51) {
      return 0;
    }
  }

  else
  {
    if (*(void *)_libkernel_functions >= 3uLL)
    {
      int v9 = *(void (**)(uint64_t))(_libkernel_functions + 88);
      if (v9) {
        v9(v7);
      }
    }

    return 0;
  }

  return result;
}

kern_return_t thread_get_register_pointer_values( thread_t thread, uintptr_t *sp, size_t *length, uintptr_t *values)
{
  kern_return_t result;
  uintptr_t v9;
  vm_size_t v10;
  size_t v11;
  uint64_t i;
  uintptr_t v13;
  mach_msg_type_number_t old_stateCnt;
  natural_t old_state[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  if (!length) {
    return 4;
  }
  size_t v7 = *length;
  if (!values && v7) {
    return 4;
  }
  int v31 = 0u;
  char v32 = 0u;
  int v29 = 0u;
  sigset_t v30 = 0u;
  int v27 = 0u;
  uint64_t v28 = 0u;
  int v25 = 0u;
  unsigned int v26 = 0u;
  int v24 = 0u;
  __int128 v22 = 0u;
  uint64_t v23 = 0u;
  unint64_t v20 = 0u;
  char v21 = 0u;
  unint64_t v18 = 0u;
  BOOL v19 = 0u;
  *(_OWORD *)old_state = 0u;
  unint64_t v17 = 0u;
  old_stateCnt = 68;
  __n128 result = thread_get_state(thread, 6, old_state, &old_stateCnt);
  if (!result)
  {
    if (sp)
    {
      int v9 = *((void *)&v31 + 1) - 128LL;
      if (*((void *)&v31 + 1) < 0x80uLL) {
        int v9 = 0LL;
      }
      *sp = v9;
    }

    size_t v10 = vm_page_size;
    if ((unint64_t)v31 <= vm_page_size)
    {
      __int128 v11 = 0LL;
    }

    else
    {
      __int128 v11 = 1LL;
      if (values && v7)
      {
        *values = v31;
        size_t v10 = vm_page_size;
        __int128 v11 = 1LL;
      }
    }

    for (uint64_t i = 0LL; i != 58; i += 2LL)
    {
      int v13 = *(void *)&old_state[i];
      if (v13 > v10)
      {
        if (values && v11 < v7)
        {
          values[v11] = v13;
          size_t v10 = vm_page_size;
        }

        ++v11;
      }
    }

    *length = v11;
    if (v11 > v7 || v7 == 0) {
      return 52;
    }
    else {
      return 0;
    }
  }

  return result;
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  int result = __renameatx_np(a1, a2, a3, a4, a5);
  if (!result)
  {
    do
      unsigned int v6 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v6 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  int result = __renameatx_np(-2, a1, -2, a2, a3);
  if (!result)
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v4 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

uint64_t rename_ext(const char *a1, const char *a2, unsigned int a3)
{
  uint64_t result = __renameatx_np(-2, a1, -2, a2, a3);
  if (!(_DWORD)result)
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v4 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

int chmod(const char *a1, mode_t a2)
{
  int result = __chmod(a1, a2);
  if (result < 0)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v6 = *(int **)(StatusReg + 8);
    if (!v6) {
      unsigned int v6 = &errno;
    }
    int v7 = a2 & 0xC00;
    if (*v6 == 1 && v7 != 0)
    {
      if ((a2 & 0x400) == 0) {
        goto LABEL_22;
      }
      int result = __chmod(a1, a2 ^ 0x400);
      if (result < 0)
      {
        int v9 = *(int **)(StatusReg + 8);
        if (!v9) {
          int v9 = &errno;
        }
        if (*v9 == 1)
        {
LABEL_22:
          if ((a2 & 0x800) == 0) {
            goto LABEL_12;
          }
          int result = __chmod(a1, a2 ^ 0x800);
          if (result < 0)
          {
            size_t v10 = *(int **)(StatusReg + 8);
            if (!v10) {
              size_t v10 = &errno;
            }
            if (*v10 == 1)
            {
LABEL_12:
              if (v7 == 3072) {
                return __chmod(a1, a2 ^ 0xC00);
              }
            }
          }
        }
      }
    }
  }

  return result;
}

int fchmod(int a1, mode_t a2)
{
  int result = __fchmod(a1, a2);
  if (result < 0)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unsigned int v6 = *(int **)(StatusReg + 8);
    if (!v6) {
      unsigned int v6 = &errno;
    }
    int v7 = a2 & 0xC00;
    if (*v6 == 1 && v7 != 0)
    {
      if ((a2 & 0x400) == 0) {
        goto LABEL_22;
      }
      int result = __fchmod(a1, a2 ^ 0x400);
      if (result < 0)
      {
        int v9 = *(int **)(StatusReg + 8);
        if (!v9) {
          int v9 = &errno;
        }
        if (*v9 == 1)
        {
LABEL_22:
          if ((a2 & 0x800) == 0) {
            goto LABEL_12;
          }
          int result = __fchmod(a1, a2 ^ 0x800);
          if (result < 0)
          {
            size_t v10 = *(int **)(StatusReg + 8);
            if (!v10) {
              size_t v10 = &errno;
            }
            if (*v10 == 1)
            {
LABEL_12:
              if (v7 == 3072) {
                return __fchmod(a1, a2 ^ 0xC00);
              }
            }
          }
        }
      }
    }
  }

  return result;
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  BOOL v2 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (v2)
  {
    timespec v3 = (char *)v2(248LL);
    *a1 = v3;
    if (v3)
    {
      unsigned int v4 = v3;
      int result = 0;
      *((void *)v4 + 14) = -1LL;
      *((void *)v4 + 15) = -1LL;
      *((_DWORD *)v4 + 19) = -1;
      *((void *)v4 + 6) = 0LL;
      *((void *)v4 + 7) = 1LL;
      *(_DWORD *)unsigned int v4 = 0;
      *(void *)(v4 + 4) = 0LL;
      *(void *)(v4 + 20) = 0LL;
      *(void *)(v4 + 12) = 0LL;
      *((void *)v4 + 24) = 0LL;
      *((void *)v4 + 4) = 0LL;
      *((void *)v4 + 5) = 0LL;
      *((_DWORD *)v4 + 7) = 0;
      *((_DWORD *)v4 + 16) = 0;
      *(void *)(v4 + 68) = -1LL;
      *(_OWORD *)(v4 + 216) = 0u;
      *(_OWORD *)(v4 + 200) = 0u;
      *((_DWORD *)v4 + 27) = 0;
      *((void *)v4 + 20) = 0LL;
      v4[168] = 0;
      *((void *)v4 + 16) = 0LL;
      *((void *)v4 + 17) = 0LL;
      *((_DWORD *)v4 + 38) = 0;
      *((void *)v4 + 18) = 0LL;
      *(void *)(v4 + 172) = 0LL;
      *(void *)(v4 + 180) = 0LL;
      *((void *)v4 + 29) = 0LL;
      *((void *)v4 + 30) = 0LL;
      *((void *)v4 + 11) = 0LL;
      *((void *)v4 + 12) = 0LL;
      *((void *)v4 + 10) = 0LL;
      *((_WORD *)v4 + 52) = 0;
      return result;
    }
  }

  else
  {
    *a1 = 0LL;
  }

  return 12;
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = *a1;
  if (!*a1) {
    return 22;
  }
  timespec v3 = *a1;
  if (!v2[24] || (v4 = *(void (**)(void))(_libkernel_functions + 24), timespec v3 = *a1, !v4) || (v4(), (timespec v3 = *a1) != 0LL))
  {
    if (!v3[26]) {
      goto LABEL_13;
    }
    v3[26] = 0LL;
    uint64_t v5 = *(void (**)(void))(_libkernel_functions + 24);
    if (v5) {
      v5();
    }
    timespec v3 = *a1;
    if (*a1)
    {
LABEL_13:
      if (!v3[27]) {
        goto LABEL_17;
      }
      v3[27] = 0LL;
      unsigned int v6 = *(void (**)(void))(_libkernel_functions + 24);
      if (v6) {
        v6();
      }
      timespec v3 = *a1;
      if (*a1)
      {
LABEL_17:
        if (!v3[28]) {
          goto LABEL_21;
        }
        v3[28] = 0LL;
        int v7 = *(void (**)(void))(_libkernel_functions + 24);
        if (v7) {
          v7();
        }
        timespec v3 = *a1;
        if (*a1)
        {
LABEL_21:
          if (!v3[25]) {
            goto LABEL_25;
          }
          v3[25] = 0LL;
          __n128 v8 = *(void (**)(void))(_libkernel_functions + 24);
          if (v8) {
            v8();
          }
          timespec v3 = *a1;
          if (*a1)
          {
LABEL_25:
            if (!v3[29]) {
              goto LABEL_36;
            }
            v3[29] = 0LL;
            int v9 = *(void (**)(void))(_libkernel_functions + 24);
            if (v9) {
              v9();
            }
            timespec v3 = *a1;
            if (*a1)
            {
LABEL_36:
              if (v3[30])
              {
                v3[30] = 0LL;
                size_t v10 = *(void (**)(void))(_libkernel_functions + 24);
                if (v10) {
                  v10();
                }
              }
            }
          }
        }
      }
    }
  }

  __int128 v11 = *(void (**)(void *))(_libkernel_functions + 24);
  if (v11) {
    v11(v2);
  }
  int result = 0;
  *a1 = 0LL;
  return result;
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  _WORD *v2 = a2;
  return result;
}

int posix_spawnattr_getflags(const posix_spawnattr_t *a1, __int16 *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = (__int16 *)*a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  *a2 = *v2;
  return result;
}

int posix_spawnattr_getsigdefault(const posix_spawnattr_t *a1, sigset_t *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  *a2 = v2[1];
  return result;
}

int posix_spawnattr_getpgroup(const posix_spawnattr_t *a1, pid_t *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  *a2 = v2[3];
  return result;
}

int posix_spawnattr_getsigmask(const posix_spawnattr_t *a1, sigset_t *a2)
{
  if (!a1) {
    return 22;
  }
  BOOL v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  *a2 = v2[2];
  return result;
}

int posix_spawnattr_getbinpref_np(const posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  if (!a1) {
    return 22;
  }
  int result = 22;
  if (a3)
  {
    unsigned int v6 = (char *)*a1;
    if (*a1)
    {
      if (a2)
      {
        size_t v7 = a2 - 1;
        if (a2 - 1 >= 3) {
          size_t v7 = 3LL;
        }
        size_t v8 = v7 + 1;
        int v9 = (cpu_type_t *)(v6 + 16);
        do
        {
          cpu_type_t v10 = *v9++;
          *a3++ = v10;
          --v8;
        }

        while (v8);
        size_t v11 = v7 + 1;
      }

      else
      {
        size_t v11 = 0LL;
      }

      int result = 0;
      if (a4) {
        *a4 = v11;
      }
    }
  }

  return result;
}

int posix_spawnattr_getarchpref_np( const posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, cpu_subtype_t *a4, size_t *a5)
{
  if (!a1) {
    return 22;
  }
  int result = 22;
  if (a4)
  {
    if (a3)
    {
      size_t v7 = (char *)*a1;
      if (*a1)
      {
        if (a2)
        {
          size_t v8 = a2 - 1;
          if (a2 - 1 >= 3) {
            size_t v8 = 3LL;
          }
          size_t v9 = v8 + 1;
          cpu_type_t v10 = (cpu_subtype_t *)(v7 + 112);
          do
          {
            *a3++ = *(v10 - 24);
            cpu_subtype_t v11 = *v10++;
            *a4++ = v11;
            --v9;
          }

          while (v9);
          size_t v12 = v8 + 1;
        }

        else
        {
          size_t v12 = 0LL;
        }

        int result = 0;
        if (a5) {
          *a5 = v12;
        }
      }
    }
  }

  return result;
}

uint64_t posix_spawnattr_getpcontrol_np(uint64_t *a1, _DWORD *a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(_DWORD *)(v2 + 32);
  return result;
}

uint64_t posix_spawnattr_getprocesstype_np(uint64_t *a1, _DWORD *a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(_DWORD *)(v2 + 36);
  return result;
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  v2[1] = *a2;
  return result;
}

int posix_spawnattr_setpgroup(posix_spawnattr_t *a1, pid_t a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  v2[3] = a2;
  return result;
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 0;
  v2[2] = *a2;
  return result;
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  if (!a1) {
    return 22;
  }
  int result = 22;
  if (a3)
  {
    unsigned int v6 = (char *)*a1;
    if (v6)
    {
      if (a2)
      {
        size_t v7 = a2 - 1;
        if (a2 - 1 >= 3) {
          size_t v7 = 3LL;
        }
        size_t v8 = v7 + 1;
        size_t v9 = v6 + 112;
        do
        {
          int v10 = *a3++;
          *(v9 - 24) = v10;
          *v9++ = -1;
          --v8;
        }

        while (v8);
        size_t v11 = v7 + 1;
        size_t v12 = v11;
        if (!a4) {
          goto LABEL_11;
        }
      }

      else
      {
        LODWORD(v11) = 0;
        size_t v12 = 0LL;
        if (!a4) {
          goto LABEL_11;
        }
      }

      *a4 = v12;
LABEL_11:
      if (v11 <= 3)
      {
        uint64_t v13 = 4LL * v11;
        do
        {
          size_t v14 = &v6[v13];
          *((_DWORD *)v14 + 4) = 0;
          *((_DWORD *)v14 + 28) = -1;
          v13 += 4LL;
        }

        while (v13 != 16);
      }

      return 0;
    }
  }

  return result;
}

int posix_spawnattr_setarchpref_np( posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, cpu_subtype_t *a4, size_t *a5)
{
  if (!a1) {
    return 22;
  }
  int result = 22;
  if (a4)
  {
    if (a3)
    {
      size_t v7 = (char *)*a1;
      if (v7)
      {
        if (a2)
        {
          size_t v8 = a2 - 1;
          if (a2 - 1 >= 3) {
            size_t v8 = 3LL;
          }
          size_t v9 = v8 + 1;
          int v10 = v7 + 112;
          do
          {
            int v11 = *a3++;
            *(v10 - 24) = v11;
            int v12 = *a4++;
            *v10++ = v12;
            --v9;
          }

          while (v9);
          size_t v13 = v8 + 1;
          size_t v14 = v13;
          if (!a5) {
            goto LABEL_12;
          }
        }

        else
        {
          LODWORD(v13) = 0;
          size_t v14 = 0LL;
          if (!a5) {
            goto LABEL_12;
          }
        }

        *a5 = v14;
LABEL_12:
        if (v13 <= 3)
        {
          uint64_t v15 = 4LL * v13;
          do
          {
            unint64_t v16 = &v7[v15];
            *((_DWORD *)v16 + 4) = 0;
            *((_DWORD *)v16 + 28) = -1;
            v15 += 4LL;
          }

          while (v15 != 16);
        }

        return 0;
      }
    }
  }

  return result;
}

uint64_t posix_spawnattr_setpcontrol_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t posix_spawnattr_setprocesstype_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 36) = a2;
  return result;
}

uint64_t posix_spawnattr_setdataless_iopolicy_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 128) |= 4u;
  *(_DWORD *)(v2 + 152) = a2;
  return result;
}

uint64_t posix_spawnattr_set_use_sec_transition_shims_np(uint64_t *a1)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v1 + 128) |= 8u;
  return result;
}

uint64_t posix_spawnattr_set_subsystem_root_path_np(uint64_t *a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  if (a2)
  {
    unsigned int v4 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
    if (!v4) {
      return 12LL;
    }
    uint64_t v5 = v4(1024LL);
    if (!v5) {
      return 12LL;
    }
    uint64_t v6 = v5;
    if ((unint64_t)(*((uint64_t (**)(uint64_t, uint64_t, uint64_t))_libkernel_string_functions + 11))( v5,  a2,  1024LL) >= 0x400)
    {
      size_t v7 = *(void (**)(uint64_t))(_libkernel_functions + 24);
      if (v7) {
        v7(v6);
      }
      return 63LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v9 = *(void *)(v2 + 232);
  *(void *)(v2 + 232) = v6;
  int v10 = *(void (**)(uint64_t))(_libkernel_functions + 24);
  if (v10) {
    v10(v9);
  }
  return 0LL;
}

uint64_t posix_spawnattr_set_platform_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 108) = a2;
  return result;
}

uint64_t posix_spawnattr_disable_ptr_auth_a_keys_np(uint64_t *a1)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v1 + 128) |= 1u;
  return result;
}

uint64_t posix_spawnattr_set_alt_rosetta_np(uint64_t *a1)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v1 + 128) |= 2u;
  return result;
}

uint64_t posix_spawnattr_set_crash_behavior_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 148) = a2;
  return result;
}

uint64_t posix_spawnattr_set_crash_behavior_deadline_np(uint64_t *a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(v2 + 160) = a2;
  return result;
}

uint64_t posix_spawnattr_set_crash_count_np(uint64_t *a1, int a2, int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v3 + 172) = a2;
  *(_DWORD *)(v3 + 176) = a3;
  return result;
}

int posix_spawnattr_setspecialport_np(posix_spawnattr_t *a1, mach_port_t a2, int a3)
{
  uint64_t v4 = 0LL;
  mach_port_t v5 = a2;
  uint64_t v6 = 0LL;
  int v7 = a3;
  return posix_spawn_appendportaction_np((uint64_t *)a1, (__int128 *)&v4);
}

uint64_t posix_spawn_appendportaction_np(uint64_t *a1, __int128 *a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = 22LL;
  if (a2)
  {
    uint64_t v4 = *a1;
    if (*a1)
    {
      mach_port_t v5 = *(int **)(v4 + 192);
      if (v5)
      {
        int v6 = *v5;
        int v7 = v5[1];
        if (*v5 != v7)
        {
LABEL_15:
          uint64_t v3 = 0LL;
          int v11 = &v5[6 * v7];
          __int128 v12 = *a2;
          *((void *)v11 + 3) = *((void *)a2 + 2);
          *(_OWORD *)(v11 + 2) = v12;
          ++v5[1];
          return v3;
        }

        if (v6 + 0x40000000 >= 0)
        {
          int v8 = 2 * v6;
          if (is_mul_ok(2 * v6, 0x18uLL))
          {
            uint64_t v9 = *(uint64_t (**)(void))(_libkernel_functions + 32);
            if (v9)
            {
              mach_port_t v5 = (int *)v9();
              if (v5)
              {
                int *v5 = v8;
                *(void *)(v4 + 192) = v5;
                int v7 = v5[1];
                goto LABEL_15;
              }
            }
          }
        }
      }

      else
      {
        int v10 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
        if (v10)
        {
          mach_port_t v5 = (int *)v10(56LL);
          if (v5)
          {
            int v7 = 0;
            *(void *)mach_port_t v5 = 2LL;
            *(void *)(v4 + 192) = v5;
            goto LABEL_15;
          }
        }
      }

      return 12LL;
    }
  }

  return v3;
}

int posix_spawnattr_setexceptionports_np( posix_spawnattr_t *a1, exception_mask_t a2, mach_port_t a3, exception_behavior_t a4, thread_state_flavor_t a5)
{
  LODWORD(v6) = 1;
  DWORD1(v6) = a2;
  DWORD2(v6) = a3;
  HIDWORD(v6) = a4;
  thread_state_flavor_t v7 = a5;
  int v8 = 0;
  return posix_spawn_appendportaction_np((uint64_t *)a1, &v6);
}

int posix_spawnattr_setauditsessionport_np(posix_spawnattr_t *a1, mach_port_t a2)
{
  *(void *)&__int128 v3 = 2LL;
  *((void *)&v3 + 1) = a2;
  uint64_t v4 = 0LL;
  return posix_spawn_appendportaction_np((uint64_t *)a1, &v3);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (v2)
  {
    __int128 v3 = (void *)v2(2088LL);
    *a1 = v3;
    if (v3)
    {
      uint64_t v4 = v3;
      int result = 0;
      void *v4 = 2LL;
      return result;
    }
  }

  else
  {
    *a1 = 0LL;
  }

  return 12;
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  if (!a1) {
    return 22;
  }
  if (!*a1) {
    return 22;
  }
  uint64_t v2 = *(void (**)(void))(_libkernel_functions + 24);
  if (v2) {
    v2();
  }
  int result = 0;
  *a1 = 0LL;
  return result;
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  if (!a1) {
    return 22;
  }
  __int128 v6 = *a1;
  if (!*a1) {
    return 22;
  }
  int v12 = v6[1];
  if (v12 == *v6)
  {
    __int128 v6 = *a1;
    int v12 = *((_DWORD *)*a1 + 1);
  }

  v6[1] = v12 + 1;
  size_t v13 = &v6[260 * v12];
  __n128 v13[2] = 0;
  v13[3] = a2;
  _OWORD v13[4] = a4;
  *((_WORD *)v13 + 10) = a5;
  (*((void (**)(uint64_t, const char *, uint64_t))_libkernel_string_functions + 11))( (uint64_t)v13 + 22,  a3,  1024LL);
  return 0;
}

uint64_t _posix_spawn_file_actions_grow(int **a1)
{
  int v2 = **a1;
  if (v2 + 0x40000000 < 0) {
    return 12LL;
  }
  int v3 = 2 * v2;
  if (!is_mul_ok(2 * v2, 0x410uLL)) {
    return 12LL;
  }
  uint64_t v4 = *(uint64_t (**)(void))(_libkernel_functions + 32);
  if (!v4) {
    return 12LL;
  }
  uint64_t v5 = v4();
  if (!v5) {
    return 12LL;
  }
  __int128 v6 = (int *)v5;
  uint64_t result = 0LL;
  int *v6 = v3;
  *a1 = v6;
  return result;
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  if (!a1) {
    return 22;
  }
  int v3 = *a1;
  if (!*a1) {
    return 22;
  }
  int v6 = v3[1];
  if (v6 == *v3)
  {
    int v3 = *a1;
    int v6 = *((_DWORD *)*a1 + 1);
  }

  int result = 0;
  v3[1] = v6 + 1;
  thread_state_flavor_t v7 = &v3[260 * v6];
  v7[2] = 1;
  v7[3] = a2;
  return result;
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  if (!a1) {
    return 22;
  }
  uint64_t v4 = *a1;
  if (!*a1) {
    return 22;
  }
  int result = 9;
  if (a2 >> 11 <= 4 && a3 >> 11 <= 4)
  {
    int v8 = v4[1];
    if (v8 == *v4)
    {
      uint64_t v4 = *a1;
      int v8 = *((_DWORD *)*a1 + 1);
    }

    int result = 0;
    v4[1] = v8 + 1;
    uint64_t v9 = &v4[260 * v8];
    __n128 v9[2] = 2;
    void v9[3] = a2;
    v9[4] = a3;
  }

  return result;
}

uint64_t posix_spawn_file_actions_add_fileportdup2_np(int **a1, int a2, unsigned int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v4 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 9LL;
  if ((a2 + 1) >= 2 && a3 >> 11 <= 4)
  {
    int v8 = v4[1];
    if (v8 == *v4)
    {
      uint64_t v4 = *a1;
      int v8 = (*a1)[1];
    }

    uint64_t result = 0LL;
    v4[1] = v8 + 1;
    uint64_t v9 = &v4[260 * v8];
    __n128 v9[2] = 4;
    void v9[3] = a2;
    v9[4] = a3;
  }

  return result;
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  if (!a1) {
    return 22;
  }
  int v3 = *a1;
  if (!*a1) {
    return 22;
  }
  int v6 = v3[1];
  if (v6 == *v3)
  {
    int v3 = *a1;
    int v6 = *((_DWORD *)*a1 + 1);
  }

  int result = 0;
  v3[1] = v6 + 1;
  thread_state_flavor_t v7 = &v3[260 * v6];
  v7[2] = 3;
  v7[3] = a2;
  return result;
}

int posix_spawn_file_actions_addchdir_np(posix_spawn_file_actions_t *a1, const char *a2)
{
  if (!a1) {
    return 22;
  }
  int v3 = *a1;
  if (!*a1) {
    return 22;
  }
  int v5 = v3[1];
  if (v5 == *v3)
  {
    int v3 = *a1;
    int v5 = *((_DWORD *)*a1 + 1);
  }

  v3[1] = v5 + 1;
  thread_state_flavor_t v7 = &v3[260 * v5];
  v7[2] = 5;
  if ((unint64_t)(*((uint64_t (**)(_DWORD *, const char *, uint64_t))_libkernel_string_functions + 11))( v7 + 4,  a2,  1024LL) < 0x400) {
    return 0;
  }
  --*((_DWORD *)*a1 + 1);
  return 63;
}

int posix_spawn_file_actions_addfchdir_np(posix_spawn_file_actions_t *a1, int a2)
{
  if (!a1) {
    return 22;
  }
  int v3 = *a1;
  if (!*a1) {
    return 22;
  }
  int v6 = v3[1];
  if (v6 == *v3)
  {
    int v3 = *a1;
    int v6 = *((_DWORD *)*a1 + 1);
  }

  int result = 0;
  v3[1] = v6 + 1;
  thread_state_flavor_t v7 = &v3[260 * v6];
  v7[2] = 6;
  v7[3] = a2;
  return result;
}

uint64_t posix_spawnattr_setcpumonitor_default(uint64_t *a1)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v1 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_OWORD *)(v1 + 40) = xmmword_1801F7A50;
  return result;
}

uint64_t posix_spawnattr_setcpumonitor(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(v3 + 40) = a2;
  *(void *)(v3 + 48) = a3;
  return result;
}

uint64_t posix_spawnattr_getcpumonitor(uint64_t *a1, void *a2, void *a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)(v3 + 40);
  *a3 = *(void *)(v3 + 48);
  return result;
}

uint64_t posix_spawnattr_setjetsam(uint64_t *a1, __int16 a2, int a3, int a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v4 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_WORD *)(v4 + 64) = a2 & 0x7FF3 | ((__int16)(a2 << 13) >> 15) & 0xC | 0x8000;
  *(_DWORD *)(v4 + 68) = a3;
  *(_DWORD *)(v4 + 72) = a4;
  *(_DWORD *)(v4 + 76) = a4;
  return result;
}

uint64_t posix_spawnattr_setjetsam_ext(uint64_t *a1, __int16 a2, int a3, int a4, int a5)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v5 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_WORD *)(v5 + 64) = a2 | 0x8000;
  *(_DWORD *)(v5 + 68) = a3;
  *(_DWORD *)(v5 + 72) = a4;
  *(_DWORD *)(v5 + 76) = a5;
  return result;
}

uint64_t posix_spawnattr_set_threadlimit_ext(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 92) = a2;
  return result;
}

uint64_t posix_spawnattr_set_importancewatch_port_np(uint64_t *a1, unsigned int a2, unsigned int *a3)
{
  if (a2 > 0x80) {
    return 22LL;
  }
  if (!a2) {
    return 0LL;
  }
  uint64_t v14 = v6;
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  uint64_t v10 = a2;
  while (1)
  {
    *(void *)&__int128 v12 = 3LL;
    unsigned int v11 = *a3++;
    *((void *)&v12 + 1) = v11;
    uint64_t v13 = 0LL;
    uint64_t result = posix_spawn_appendportaction_np(a1, &v12);
    if ((_DWORD)result) {
      break;
    }
    if (!--v10) {
      return 0LL;
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_registered_ports_np(uint64_t *a1, unsigned int *a2, unsigned int a3)
{
  if (a3 > 3) {
    return 22LL;
  }
  if (!a3) {
    return 0LL;
  }
  uint64_t v14 = v6;
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  uint64_t v17 = v4;
  uint64_t v10 = a3;
  while (1)
  {
    *(void *)&__int128 v12 = 4LL;
    unsigned int v11 = *a2++;
    *((void *)&v12 + 1) = v11;
    uint64_t v13 = 0LL;
    uint64_t result = posix_spawn_appendportaction_np(a1, &v12);
    if ((_DWORD)result) {
      break;
    }
    if (!--v10) {
      return 0LL;
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_ptrauth_task_port_np(uint64_t *a1, unsigned int a2)
{
  *(void *)&__int128 v3 = 5LL;
  *((void *)&v3 + 1) = a2;
  uint64_t v4 = 0LL;
  return posix_spawn_appendportaction_np(a1, &v3);
}

uint64_t posix_spawnattr_getmacpolicyinfo_np(uint64_t *a1, uint64_t a2, void *a3, void *a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a3)
  {
    if (a2)
    {
      uint64_t v8 = *a1;
      if (v8)
      {
        uint64_t v9 = *(void *)(v8 + 200);
        if (v9 && (uint64_t v10 = *(unsigned int *)(v9 + 4), (int)v10 >= 1))
        {
          uint64_t v12 = 0LL;
          for (uint64_t i = v9 + 8;
                (*((unsigned int (**)(uint64_t, uint64_t))_libkernel_string_functions + 8))(i, a2);
                i += 144LL)
          {
            if (v10 == ++v12) {
              return 3LL;
            }
          }

          *a3 = *(void *)(v9 + 144 * v12 + 136);
          uint64_t result = 0LL;
          if (a4) {
            *a4 = *(void *)(v9 + 144 * v12 + 144);
          }
        }

        else
        {
          return 3LL;
        }
      }
    }
  }

  return result;
}

uint64_t posix_spawnattr_setmacpolicyinfo_np(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a2)
  {
    uint64_t v7 = *a1;
    if (*a1)
    {
      uint64_t v10 = *(_DWORD **)(v7 + 200);
      if (v10)
      {
        uint64_t v11 = v10[1];
        if ((int)v11 >= 1)
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = v10 + 2;
          while (1)
          {
            uint64_t result = (*((uint64_t (**)(_DWORD *, uint64_t))_libkernel_string_functions + 8))(v13, a2);
            if (!(_DWORD)result) {
              break;
            }
            ++v12;
            v13 += 36;
            if (v11 == v12)
            {
              LODWORD(v11) = v10[1];
              goto LABEL_10;
            }
          }

          char v21 = &v10[36 * v12];
          *((void *)v21 + 17) = a3;
          *((void *)v21 + 18) = a4;
          return result;
        }

LABEL_10:
        if ((_DWORD)v11 != *v10)
        {
LABEL_20:
          unint64_t v20 = &v10[36 * (int)v11];
          (*((void (**)(_DWORD *, uint64_t, uint64_t))_libkernel_string_functions + 11))(v20 + 2, a2, 128LL);
          uint64_t result = 0LL;
          *((void *)v20 + 17) = a3;
          *((void *)v20 + 18) = a4;
          ++v10[1];
          return result;
        }

        if ((int)v11 + 0x40000000 >= 0)
        {
          int v14 = 2 * v11;
          if (is_mul_ok(2 * (int)v11, 0x90uLL))
          {
            uint64_t v15 = _libkernel_functions;
            uint64_t v16 = *(uint64_t (**)(_DWORD *, uint64_t))(_libkernel_functions + 32);
            if (v16)
            {
              uint64_t v17 = (_DWORD *)v16(v10, (144LL * v14) | 8);
              if (v17)
              {
                *(void *)(v7 + 200) = v17;
                *uint64_t v17 = v14;
                uint64_t v10 = v17;
                LODWORD(v11) = v17[1];
                goto LABEL_20;
              }

              uint64_t v15 = _libkernel_functions;
            }

            __int128 v22 = *(void (**)(_DWORD *))(v15 + 24);
            if (v22) {
              v22(v10);
            }
            goto LABEL_25;
          }
        }
      }

      else
      {
        unint64_t v18 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
        if (!v18)
        {
LABEL_25:
          *(void *)(v7 + 200) = 0LL;
          return 12LL;
        }

        BOOL v19 = (void *)v18(296LL);
        *(void *)(v7 + 200) = v19;
        if (v19)
        {
          uint64_t v10 = v19;
          LODWORD(v11) = 0;
          *BOOL v19 = 2LL;
          goto LABEL_20;
        }
      }

      return 12LL;
    }
  }

  return result;
}

  qword_18C50D128 = (uint64_t)"Metadata subtype unknown";
  qword_18C50D158 = v6;
  __break(1u);
  return result;
}

    uint64_t v11 = (_DWORD *)(v10 + *(_DWORD *)v9 * *(unsigned __int16 *)(v3 + 24));
    uint64_t v12 = *(unsigned __int16 *)(a3 + 2);
    v11[8] = v12;
    v11[20] = 0;
    v11[21] = v12;
    return result;
  }

  if (*(_DWORD *)v3 <= v6)
  {
    uint64_t v7 = *(_DWORD *)(v3 + 12);
LABEL_7:
  }

  __int128 v3 = *(_WORD *)(a2 + 4);
  if ((v3 & 1) == 0)
  {
    uint64_t v8 = *(unsigned int *)(v4 - 8);
    if (v4 == *(void *)(result + 64) + v8 * *(unsigned __int16 *)(v5 + 24) + 16LL)
    {
LABEL_12:
      *(_DWORD *)a2 = v8;
      *(_WORD *)(a2 + 4) = v3 | 1;
      uint64_t v9 = *(int **)(result + 8);
      goto LABEL_14;
    }

    goto LABEL_22;
  }

uint64_t posix_spawnattr_setcoalition_np(uint64_t *a1, uint64_t a2, unsigned int a3, int a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a3 <= 1)
  {
    uint64_t v7 = *a1;
    if (*a1)
    {
      uint64_t v10 = *(_OWORD **)(v7 + 208);
      if (v10)
      {
LABEL_8:
        uint64_t result = 0LL;
        uint64_t v13 = (char *)v10 + 24 * a3;
        *(void *)uint64_t v13 = a2;
        *((_DWORD *)v13 + 2) = a4;
        return result;
      }

      uint64_t v11 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
      if (v11)
      {
        uint64_t v12 = (_OWORD *)v11(48LL);
        if (v12)
        {
          uint64_t v10 = v12;
          v12[1] = 0u;
          __n128 v12[2] = 0u;
          *uint64_t v12 = 0u;
          *(void *)(v7 + 208) = v12;
          goto LABEL_8;
        }
      }

      return 12LL;
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_qos_clamp_np(uint64_t *a1, unint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a2 <= 3)
  {
    uint64_t v4 = *a1;
    if (v4)
    {
      uint64_t result = 0LL;
      *(void *)(v4 + 80) = a2;
    }
  }

  return result;
}

uint64_t posix_spawnattr_get_qos_clamp_np(uint64_t *a1, void *a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(void *)(v2 + 80);
  return result;
}

uint64_t posix_spawnattr_set_darwin_role_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 88) = a2;
  return result;
}

uint64_t posix_spawnattr_get_darwin_role_np(uint64_t *a1, void *a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a2 = *(int *)(v2 + 88);
  return result;
}

uint64_t posix_spawnattr_set_persona_np(uint64_t *a1, int a2, unsigned int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a3 <= 3)
  {
    uint64_t v6 = *a1;
    if (*a1)
    {
      uint64_t v8 = *(_DWORD **)(v6 + 216);
      if (v8)
      {
LABEL_8:
        uint64_t result = 0LL;
        *uint64_t v8 = a2;
        v8[1] = a3;
        return result;
      }

      uint64_t v9 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
      if (v9)
      {
        uint64_t v10 = v9(88LL);
        if (v10)
        {
          uint64_t v8 = (_DWORD *)v10;
          *(_DWORD *)(v10 + 84) = 0;
          *(void *)(v10 + 8) = 0LL;
          *(void *)(v10 + 16) = 0LL;
          *(void *)(v6 + 216) = v10;
          goto LABEL_8;
        }
      }

      return 12LL;
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_persona_uid_np(uint64_t a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  if (!*(void *)a1) {
    return 22LL;
  }
  uint64_t v2 = *(void *)(*(void *)a1 + 216LL);
  if (!v2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 4) |= 0x10000u;
  *(_DWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t posix_spawnattr_set_persona_gid_np(uint64_t a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  if (!*(void *)a1) {
    return 22LL;
  }
  uint64_t v2 = *(void *)(*(void *)a1 + 216LL);
  if (!v2) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v2 + 12) = a2;
  *(_DWORD *)(v2 + 4) |= 0x20000u;
  return result;
}

uint64_t posix_spawnattr_set_persona_groups_np(uint64_t *a1, unsigned int a2, int *a3, int a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a2 <= 0x10)
  {
    if (a3)
    {
      uint64_t v6 = *a1;
      if (v6)
      {
        uint64_t v7 = *(_DWORD **)(v6 + 216);
        if (v7)
        {
          v7[4] = a2;
          if (a2)
          {
            uint64_t v8 = a2;
            uint64_t v9 = v7 + 5;
            do
            {
              int v10 = *a3++;
              *v9++ = v10;
              --v8;
            }

            while (v8);
          }

          uint64_t result = 0LL;
          v7[21] = a4;
          v7[1] |= 0x40000u;
        }
      }
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_max_addr_np(uint64_t *a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(v2 + 96) = a2;
  return result;
}

int posix_spawnattr_setnosmt_np(const posix_spawnattr_t *attr)
{
  if (!attr) {
    return 22;
  }
  uint64_t v1 = *attr;
  if (!*attr) {
    return 22;
  }
  int result = 0;
  v1[104] = 1;
  return result;
}

int posix_spawnattr_set_csm_np(const posix_spawnattr_t *attr, uint32_t flags)
{
  if (!attr) {
    return 22;
  }
  int result = 22;
  if (flags <= 7)
  {
    uint64_t v4 = *attr;
    if (v4)
    {
      if ((flags & 5) != 0) {
        v4[105] = 1;
      }
      int result = 0;
      if ((flags & 3) != 0) {
        v4[104] = 1;
      }
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_uid_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t v4 = *(void *)(v2 + 224);
  if (v4)
  {
    int v5 = *(_DWORD *)v4 | 0x10000;
  }

  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
    if (!v7) {
      return 12LL;
    }
    uint64_t v4 = v7(340LL);
    if (!v4) {
      return 12LL;
    }
    *(_DWORD *)(v4 + 80) = 0;
    *(_BYTE *)(v4 + 84) = 0;
    *(void *)uint64_t v4 = 0LL;
    *(void *)(v4 + 8) = 0LL;
    *(_DWORD *)(v4 + 16) = 0;
    int v5 = 0x10000;
    *(void *)(v2 + 224) = v4;
  }

  uint64_t v6 = 0LL;
  *(_DWORD *)uint64_t v4 = v5;
  *(_DWORD *)(v4 + 4) = a2;
  return v6;
}

uint64_t posix_spawnattr_set_gid_np(uint64_t *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t v4 = *(void *)(v2 + 224);
  if (v4)
  {
    int v5 = *(_DWORD *)v4 | 0x20000;
  }

  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
    if (!v7) {
      return 12LL;
    }
    uint64_t v4 = v7(340LL);
    if (!v4) {
      return 12LL;
    }
    *(_DWORD *)(v4 + 80) = 0;
    *(_BYTE *)(v4 + 84) = 0;
    *(void *)uint64_t v4 = 0LL;
    *(void *)(v4 + 8) = 0LL;
    *(_DWORD *)(v4 + 16) = 0;
    int v5 = 0x20000;
    *(void *)(v2 + 224) = v4;
  }

  uint64_t v6 = 0LL;
  *(_DWORD *)(v4 + 8) = a2;
  *(_DWORD *)uint64_t v4 = v5;
  return v6;
}

uint64_t posix_spawnattr_set_groups_np(uint64_t *a1, unsigned int a2, int *a3, int a4)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v5 = 22LL;
  if (a2 <= 0x10)
  {
    uint64_t v6 = a3;
    if (a3)
    {
      uint64_t v7 = *a1;
      if (*a1)
      {
        uint64_t v9 = *(void *)(v7 + 224);
        if (!v9)
        {
          int v10 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
          if (!v10) {
            return 12LL;
          }
          uint64_t v9 = v10(340LL);
          if (!v9) {
            return 12LL;
          }
          *(_DWORD *)(v9 + 80) = 0;
          *(_BYTE *)(v9 + 84) = 0;
          *(void *)uint64_t v9 = 0LL;
          *(void *)(v9 + 8) = 0LL;
          *(_DWORD *)(v9 + 16) = 0;
          *(void *)(v7 + 224) = v9;
        }

        *(_DWORD *)(v9 + 12) = a2;
        if (a2)
        {
          uint64_t v11 = a2;
          uint64_t v12 = (_DWORD *)(v9 + 16);
          do
          {
            int v13 = *v6++;
            *v12++ = v13;
            --v11;
          }

          while (v11);
        }

        uint64_t v5 = 0LL;
        *(_DWORD *)(v9 + 80) = a4;
        *(_DWORD *)v9 |= 0x40000u;
      }
    }
  }

  return v5;
}

uint64_t posix_spawnattr_set_login_np(uint64_t *a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t v5 = *(_DWORD **)(v2 + 224);
  if (v5) {
    goto LABEL_11;
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (v6)
  {
    uint64_t v7 = v6(340LL);
    if (v7)
    {
      uint64_t v5 = (_DWORD *)v7;
      *(_DWORD *)(v7 + 80) = 0;
      *(_BYTE *)(v7 + 84) = 0;
      *(void *)uint64_t v7 = 0LL;
      *(void *)(v7 + 8) = 0LL;
      *(_DWORD *)(v7 + 16) = 0;
      *(void *)(v2 + 224) = v7;
LABEL_11:
      (*((void (**)(_DWORD *, uint64_t, uint64_t))_libkernel_string_functions + 11))(v5 + 21, a2, 256LL);
      uint64_t result = 0LL;
      *v5 |= 0x80000u;
      return result;
    }
  }

  return 12LL;
}

uint64_t posix_spawnattr_set_conclave_id_np(uint64_t *a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  if (*(void *)(v2 + 240)) {
    goto LABEL_11;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (v4)
  {
    uint64_t v5 = v4(128LL);
    if (v5)
    {
      *(void *)(v2 + 240) = v5;
LABEL_11:
      (*((void (**)(void))_libkernel_string_functions + 11))();
      return 0LL;
    }
  }

  return 12LL;
}

uint64_t posix_spawnattr_set_portlimits_ext(uint64_t *a1, int a2, int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v3 + 132) = a2;
  *(_DWORD *)(v3 + 136) = a3;
  return result;
}

uint64_t posix_spawnattr_set_filedesclimit_ext(uint64_t *a1, int a2, int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v3 + 140) = a2;
  *(_DWORD *)(v3 + 144) = a3;
  return result;
}

uint64_t posix_spawnattr_set_kqworklooplimit_ext(uint64_t *a1, int a2, int a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v3 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(v3 + 180) = a2;
  *(_DWORD *)(v3 + 184) = a3;
  return result;
}

uint64_t posix_spawnattr_set_jetsam_ttr_np(uint64_t *a1, unsigned int a2, unsigned int *a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 22LL;
  if (a2)
  {
    uint64_t v5 = *a1;
    if (v5)
    {
      int v15 = 0;
      uint64_t v14 = 0LL;
      int v6 = -1;
      int v7 = -1;
      uint64_t v8 = a2;
      do
      {
        unsigned int v10 = *a3++;
        unsigned int v9 = v10;
        if (v10 <= 0x2710) {
          uint64_t v11 = 1LL;
        }
        else {
          uint64_t v11 = 2LL;
        }
        if (v9 <= 0x1388) {
          uint64_t v12 = 0LL;
        }
        else {
          uint64_t v12 = v11;
        }
        int v13 = *((_DWORD *)&v14 + v12);
        *((_DWORD *)&v14 + v12) = v13 + 1;
        if (v13 >= v7)
        {
          int v6 = v12;
          int v7 = v13 + 1;
        }

        --v8;
      }

      while (v8);
      uint64_t result = 0LL;
      *(_WORD *)(v5 + 64) |= posix_spawnattr_set_jetsam_ttr_np_relaunch_jetsam_flags[2 * v6];
    }
  }

  return result;
}

uint64_t posix_spawnattr_set_launch_type_np(uint64_t *a1, char a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(v2 + 168) = a2;
  return result;
}

int posix_spawn( pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(int **)(StatusReg + 8);
  if (v11) {
    uint64_t v12 = *(int **)(StatusReg + 8);
  }
  else {
    uint64_t v12 = &errno;
  }
  int v13 = *v12;
  int v45 = 0;
  if (!a3 || (uint64_t v14 = *a3) == 0LL)
  {
    if (a4)
    {
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v36 = 0u;
      goto LABEL_12;
    }

LABEL_50:
    char v32 = 0LL;
    goto LABEL_51;
  }

  int v15 = v14[1];
  if (!a4 && v15 <= 0) {
    goto LABEL_50;
  }
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v36 = 0u;
  if (!a4)
  {
LABEL_47:
    if (v15 >= 1)
    {
      *(void *)&__int128 v37 = (1040LL * v15) | 8;
      *((void *)&v37 + 1) = v14;
    }

    goto LABEL_49;
  }

LABEL_12:
  uint64_t v16 = *a4;
  if (*a4)
  {
    *(void *)&__int128 v36 = 248LL;
    *((void *)&v36 + 1) = v16;
    uint64_t v17 = v16[24];
    if (v17)
    {
      unint64_t v18 = *(int *)(v17 + 4);
      BOOL v19 = !is_mul_ok(v18, 0x18uLL);
      if (24 * v18 >= 0xFFFFFFFFFFFFFFF8LL) {
        BOOL v19 = 1;
      }
      if (v19) {
        uint64_t v20 = 0LL;
      }
      else {
        uint64_t v20 = 24 * v18 + 8;
      }
      if (v20) {
        BOOL v21 = 1;
      }
      else {
        BOOL v21 = (_DWORD)v18 == 0;
      }
      if (!v21) {
        goto LABEL_57;
      }
      *(void *)&__int128 v38 = v20;
      *((void *)&v38 + 1) = v17;
    }

    uint64_t v22 = v16[25];
    if (v22)
    {
      unint64_t v23 = *(int *)(v22 + 4);
      BOOL v24 = !is_mul_ok(v23, 0x90uLL);
      if (!is_mul_ok(v23, 0x90uLL) && (_DWORD)v23 != 0)
      {
LABEL_57:
        *uint64_t v12 = 22;
LABEL_58:
        if (v11) {
          uint64_t v34 = v11;
        }
        else {
          uint64_t v34 = &errno;
        }
        int v45 = *v34;
        goto LABEL_62;
      }

      uint64_t v26 = (144 * v23) | 8;
      if (v24) {
        uint64_t v26 = 0LL;
      }
      *(void *)&__int128 v39 = v26;
      *((void *)&v39 + 1) = v22;
    }

    uint64_t v27 = v16[26];
    if (v27)
    {
      *(void *)&__int128 v40 = 48LL;
      *((void *)&v40 + 1) = v27;
    }

    uint64_t v28 = v16[27];
    if (v28)
    {
      *(void *)&__int128 v41 = 88LL;
      *((void *)&v41 + 1) = v28;
    }

    uint64_t v29 = v16[28];
    if (v29)
    {
      *(void *)&__int128 v42 = 340LL;
      *((void *)&v42 + 1) = v29;
    }

    uint64_t v30 = v16[29];
    if (v30)
    {
      *(void *)&__int128 v43 = 1024LL;
      *((void *)&v43 + 1) = v30;
    }

    uint64_t v31 = v16[30];
    if (v31)
    {
      *(void *)&__int128 v44 = 128LL;
      *((void *)&v44 + 1) = v31;
    }
  }

  if (a3)
  {
    uint64_t v14 = *a3;
    if (*a3)
    {
      int v15 = v14[1];
      goto LABEL_47;
    }
  }

  unsigned int v10 = (void *)**(unsigned int **)(result + 8);
  uint64_t v8 = v5[1];
LABEL_14:
  if (v8 == v5[1] || (uint64_t v11 = *(void *)(result + 24)) == 0)
  {
    unsigned int v9 = 0LL;
    goto LABEL_54;
  }

  unsigned int v9 = v11 + 8LL * v8;
  uint64_t v3 = *((unsigned __int16 *)v5 + 15);
  if (v3 != 1 || (*(_BYTE *)(*(void *)(*(void *)result + 16LL) + 16LL) & 8) == 0)
  {
    if ((*(_WORD *)(v9 + 4) & 1) != 0 || (uint64_t v14 = **(unsigned int **)(result + 8), (v14 & 0x80000000) == 0))
    {
      uint64_t v12 = *(void *)(result + 64);
      int v13 = (uint64_t *)(v12 + *(_DWORD *)v9 * *((unsigned __int16 *)v5 + 12));
      int v15 = *v13;
      uint64_t v4 = v13 + 2;
      uint64_t v14 = v15;
    }

    else
    {
      qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
      __break(1u);
    }

    if ((**(_DWORD **)(result + 8) & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
      qword_18C50D158 = v14;
      __break(1u);
      goto LABEL_65;
    }

  uint64_t v11 = ((HIDWORD(v3) + v3) >> 16) + (unsigned __int16)(WORD2(v3) + v3);
  return (unsigned __int16)(WORD1(v11) + v11 + (((v11 >> 16) + (unsigned __int16)v11) >> 16));
}

LABEL_49:
  char v32 = (posix_spawn_file_actions_t *)&v36;
LABEL_51:
  if (posix_spawn_with_filter
    && _posix_spawn_with_filter(a1, a2, (const posix_spawnattr_t *)__argv, __envp, (__int128 *)v32, &v45))
  {
    int v33 = v45;
  }

  else
  {
    int v33 = __posix_spawn(a1, a2, v32, (const posix_spawnattr_t *)__argv, __envp, __envp);
    int v45 = v33;
  }

  uint64_t v11 = *(int **)(StatusReg + 8);
  if (v33 < 0) {
    goto LABEL_58;
  }
LABEL_62:
  if (!v11) {
    uint64_t v11 = &errno;
  }
  *uint64_t v11 = v13;
  return v45;
}

int execve(const char *__file, char *const *__argv, char *const *__envp)
{
  if (execve_with_filter) {
    return _execve_with_filter(__file, __argv, (char **)__envp);
  }
  else {
    return __execve(__file, __argv, __envp);
  }
}

uint64_t stackshot_config_create()
{
  uint64_t v0 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v0) {
    return 0LL;
  }
  uint64_t result = v0(64LL);
  if (result)
  {
    *(_DWORD *)uint64_t result = -1;
    *(void *)(result + 56) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)(result + 32) = 0;
  }

  return result;
}

uint64_t stackshot_config_set_pid(_DWORD *a1, int a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a1 = a2;
  return result;
}

uint64_t stackshot_config_set_flags(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 8) = a2;
  return result;
}

uint64_t stackshot_capture_with_config( void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t v8 = a1 + 3;
  if (a1[3]) {
    return 22LL;
  }
  unsigned int v10 = a1 + 4;
  a1[5] = v8;
  a1[6] = a1 + 4;
  uint64_t result = __stack_snapshot_with_config((void *)1, a1, (void *)0x40, a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    uint64_t v11 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v11) {
      uint64_t v11 = &errno;
    }
    uint64_t result = *v11;
    *uint64_t v8 = 0LL;
    *unsigned int v10 = 0;
  }

  return result;
}

uint64_t stackshot_config_get_stackshot_buffer(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t stackshot_config_get_stackshot_size(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 24)) {
    return *(unsigned int *)(a1 + 32);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t stackshot_config_set_size_hint(uint64_t a1, int a2)
{
  if (!a1 || *(void *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 32) = a2;
  return result;
}

uint64_t stackshot_config_set_delta_timestamp(uint64_t a1, uint64_t a2)
{
  if (!a1 || *(void *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 16) = a2;
  return result;
}

uint64_t stackshot_config_set_pagetable_mask(uint64_t a1, unsigned int a2)
{
  if (!a1 || *(void *)(a1 + 24)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 56) = a2;
  return result;
}

uint64_t stackshot_config_dealloc_buffer(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  mach_vm_size_t v2 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v2)
  {
    mach_vm_address_t v3 = *(void *)(a1 + 24);
    if (v3) {
      mach_vm_deallocate(mach_task_self_, v3, v2);
    }
  }

  uint64_t result = 0LL;
  *(void *)(a1 + 24) = 0LL;
  *(_DWORD *)(a1 + 32) = 0;
  return result;
}

uint64_t stackshot_config_dealloc(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  mach_vm_size_t v2 = *(unsigned int *)(a1 + 32);
  if ((_DWORD)v2)
  {
    mach_vm_address_t v3 = *(void *)(a1 + 24);
    if (v3) {
      mach_vm_deallocate(mach_task_self_, v3, v2);
    }
  }

  uint64_t v4 = *(void (**)(uint64_t))(_libkernel_functions + 24);
  if (v4) {
    v4(a1);
  }
  return 0LL;
}

int setpriority(int a1, id_t a2, int a3)
{
  int result = __setpriority(a1, a2, a3);
  if (a1 == 3 && result == -2)
  {
    if (*(void *)_libkernel_functions >= 3uLL)
    {
      uint64_t v5 = *(void (**)(void))(_libkernel_functions + 88);
      if (v5) {
        v5(0LL);
      }
    }

    return 0;
  }

  return result;
}

uint64_t fcntl_NOCANCEL( void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  switch((int)a2)
  {
    case '*':
    case '+':
    case ',':
    case '1':
    case '2':
    case '4':
    case '8':
    case '9':
    case ';':
    case '=':
    case 'A':
    case 'B':
    case 'G':
    case 'H':
    case 'K':
    case 'N':
    case 'S':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'l':
    case 'o':
    case 'q':
      goto LABEL_2;
    case '-':
    case '.':
    case '/':
    case '0':
    case '3':
    case '5':
    case '6':
    case '7':
    case ':':
    case '<':
    case '>':
    case '?':
    case '@':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'I':
    case 'J':
    case 'L':
    case 'M':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case '_':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'p':
      goto LABEL_5;
    default:
      if (((_DWORD)a2 - 7) < 4) {
LABEL_2:
      }
        unsigned int v9 = a9;
      else {
LABEL_5:
      }
        unsigned int v9 = (void *)(int)a9;
      return __fcntl_nocancel(a1, a2, v9, a4, a5, a6, a7, a8);
  }

uint64_t mach_get_times(uint64_t *a1, void *a2, __darwin_time_t *a3)
{
  if (a3)
  {
    do
    {
      uint64_t v6 = MEMORY[0xFFFFFC098];
      if (__commpage_gettimeofday_internal((uint64_t)&v9, &v10))
      {
        uint64_t v10 = 0LL;
        uint64_t result = __gettimeofday_with_mach(&v9, 0LL);
        if ((result & 0x80000000) != 0) {
          return 5LL;
        }
        if (!v10)
        {
          __break(1u);
          return result;
        }
      }
    }

    while (v6 != MEMORY[0xFFFFFC098]);
    if (a1) {
      *a1 = v10;
    }
    if (a2) {
      *a2 = v10 + v6;
    }
    uint64_t result = 0LL;
    uint64_t v8 = 1000LL * v9.tv_usec;
    *a3 = v9.tv_sec;
    a3[1] = v8;
  }

  else
  {
    _mach_continuous_time(a1, a2);
    return 0LL;
  }

  return result;
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  int v10 = a1;
  if (a1 < 0)
  {
    timeval v9 = "FD_SET underflow";
    goto LABEL_11;
  }

  if (*(void *)_libkernel_functions < 4uLL) {
    return 1;
  }
  uint64_t v5 = *(uint64_t (**)(const void *, uint64_t))(_libkernel_functions + 96);
  if (!v5) {
    return 1;
  }
  int v7 = v5(a2, 128LL);
  int result = 1;
  if (!a3 && v7)
  {
    timeval v9 = "FD_SET overflow";
LABEL_11:
    os_fault_with_payload((void *)0x12, (void *)2, &v10, (void *)4, v9, 0LL, v3, v4);
    return 0;
  }

  return result;
}

uint64_t terminate_with_reason( void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  return __terminate_with_payload(a1, a2, a3, 0LL, 0LL, a4, a5, a8);
}

int fcntl(int a1, int a2, ...)
{
  uint64_t v4 = va_arg(va, void *);
  switch(a2)
  {
    case '*':
    case '+':
    case ',':
    case '1':
    case '2':
    case '4':
    case '8':
    case '9':
    case ';':
    case '=':
    case 'A':
    case 'B':
    case 'G':
    case 'H':
    case 'K':
    case 'N':
    case 'S':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'l':
    case 'o':
    case 'q':
      goto LABEL_2;
    case '-':
    case '.':
    case '/':
    case '0':
    case '3':
    case '5':
    case '6':
    case '7':
    case ':':
    case '<':
    case '>':
    case '?':
    case '@':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'I':
    case 'J':
    case 'L':
    case 'M':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case '_':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'p':
      goto LABEL_5;
    default:
      if ((a2 - 7) < 4) {
LABEL_2:
      }
        mach_vm_size_t v2 = v4;
      else {
LABEL_5:
      }
        mach_vm_size_t v2 = (void *)(int)v4;
      return __fcntl(a1, a2, v2);
  }

int getrlimit(int a1, rlimit *a2)
{
  return __getrlimit(a1 | 0x1000, a2);
}

uint64_t system_set_sfi_window( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_ctl((void *)1, 0LL, a1, 0LL, a5, a6, a7, a8);
}

uint64_t system_get_sfi_window( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_ctl((void *)2, 0LL, 0LL, a1, a5, a6, a7, a8);
}

uint64_t sfi_set_class_offtime( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_ctl((void *)3, a1, a2, 0LL, a5, a6, a7, a8);
}

uint64_t sfi_get_class_offtime( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_ctl((void *)4, a1, 0LL, a2, a5, a6, a7, a8);
}

uint64_t sfi_process_set_flags( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_pidctl((void *)1, a1, a2, 0LL, a5, a6, a7, a8);
}

uint64_t sfi_process_get_flags( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __sfi_pidctl((void *)2, a1, 0LL, a2, a5, a6, a7, a8);
}

int ioctl(int a1, unint64_t a2, ...)
{
  mach_vm_address_t v3 = va_arg(va, void *);
  return __ioctl(a1, a2, v3);
}

uint64_t os_channel_create_extended(__int128 *a1, __int16 a2, unsigned int a3, int a4, uint64_t a5)
{
  if (a3 > 2)
  {
    int v36 = 22;
LABEL_65:
    uint64_t v39 = 0LL;
    int v56 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v56) {
      int v56 = &errno;
    }
    *int v56 = v36;
    return v39;
  }

  uint64_t v5 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v5 || (uint64_t v11 = v5(384LL)) == 0)
  {
    __int128 v37 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v37) {
      __int128 v37 = &errno;
    }
    int v36 = 12;
    *__int128 v37 = 12;
    goto LABEL_65;
  }

  uint64_t v12 = v11;
  (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v11, 384LL);
  (*((void (**)(int *, uint64_t))_libkernel_string_functions + 1))(&v81, 72LL);
  int v81 = 1;
  if (a5)
  {
    if (*(_DWORD *)(a5 + 28)) {
      v82 |= 0x200u;
    }
    int v19 = *(_DWORD *)(a5 + 96);
    if (v19) {
      v82 |= 8u;
    }
    if (*(_DWORD *)(a5 + 104)) {
      v82 |= 0x10u;
    }
    if (*(_DWORD *)(a5 + 112))
    {
      if (!v19)
      {
        int v36 = 22;
        goto LABEL_63;
      }

      v82 |= 0x40u;
    }

    int v20 = *(_DWORD *)(a5 + 32);
    if (v20)
    {
      int v21 = v82 | dword_1801F70E4[a3];
      int v82 = v21;
      if (v20 == 1) {
        int v82 = v21 | 4;
      }
    }

    if (*(_DWORD *)(a5 + 108)) {
      v82 |= 0x20u;
    }
    if (*(_DWORD *)(a5 + 124)) {
      v82 |= 0x80u;
    }
    int v87 = *(_DWORD *)(a5 + 36);
    uint64_t v86 = *(void *)(a5 + 40);
    __int128 v88 = *(_OWORD *)(a5 + 48);
  }

  int v83 = a4;
  __int16 v84 = a2;
  __int128 v85 = *a1;
  uint64_t v22 = (void *)__channel_open(&v81, (void *)0x48, v13, v14, v15, v16, v17, v18);
  if ((_DWORD)v22 == -1)
  {
    __int128 v38 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v38) {
      __int128 v38 = &errno;
    }
    int v36 = *v38;
    if (!*v38) {
      return 0LL;
    }
    goto LABEL_63;
  }

  uint64_t v28 = v22;
  if (__channel_get_info(v22, (void *)v12, (void *)0x180, v23, v24, v25, v26, v27))
  {
    uint64_t v35 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v35) {
      uint64_t v35 = &errno;
    }
    int v36 = *v35;
    if (!*v35) {
      return 0LL;
    }
    goto LABEL_62;
  }

  __int128 v40 = (_DWORD *)(*(void *)(v12 + 296) + *(void *)(v12 + 288));
  int v41 = 2 * v40[72];
  int v42 = v40[73];
  if ((v82 & 8) != 0 && (!v41 || (*(_BYTE *)(v12 + 16) & 8) == 0)
    || (v82 & 0x40) != 0 && (!v42 || (*(_BYTE *)(v12 + 16) & 0x40) == 0))
  {
    int v36 = 6;
LABEL_59:
    int v54 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v54) {
      int v54 = &errno;
    }
    *int v54 = v36;
LABEL_62:
    guarded_close_np(v28, &v89, v29, v30, v31, v32, v33, v34);
LABEL_63:
    int v55 = *(void (**)(uint64_t))(_libkernel_functions + 24);
    if (v55) {
      v55(v12);
    }
    goto LABEL_65;
  }

  __int128 v43 = *(uint64_t (**)(void))(_libkernel_functions + 16);
  if (!v43) {
    goto LABEL_58;
  }
  int v74 = *(_DWORD *)(v12 + 312);
  int v75 = *(_DWORD *)(v12 + 304);
  int v73 = *(_DWORD *)(v12 + 308);
  uint64_t v44 = (v73 - v75 + 1);
  int v78 = *(_DWORD *)(v12 + 316);
  uint64_t v45 = (v78 - v74 + 1);
  char v71 = *(_BYTE *)(v12 + 316) - *(_BYTE *)(v12 + 312) + 1 + *(_BYTE *)(v12 + 308) - *(_BYTE *)(v12 + 304) + 1;
  uint64_t v80 = v40[73];
  uint64_t v76 = (2 * v40[72]);
  uint64_t v79 = v40[74];
  int v72 = v45 + v44 + v42 + v41;
  uint64_t v77 = 96LL * (v72 + v40[74]) + 72;
  uint64_t v46 = v43();
  if (!v46)
  {
LABEL_58:
    int v36 = 12;
    goto LABEL_59;
  }

  uint64_t v39 = v46;
  uint64_t result = (*((uint64_t (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v46, v77);
  *(_DWORD *)uint64_t v39 = (_DWORD)v28;
  *(void *)(v39 + 8) = v89;
  *(void *)(v39 + 16) = v12;
  *(void *)(v39 + 24) = v40;
  __dmb(0xBu);
  uint64_t v48 = *(void *)(v39 + 24);
  unsigned int v49 = *(_DWORD *)v48;
  if (*(_DWORD *)v48 != 18)
  {
    __int128 v69 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
    if (v69)
    {
      __int128 v70 = (_BYTE *)v69(1024LL);
      uint64_t v48 = *(void *)(v39 + 24);
      unsigned int v49 = *(_DWORD *)v48;
    }

    else
    {
      __int128 v70 = 0LL;
    }

    uint64_t result = _mach_snprintf( v70,  1024,  "Schema region version mismatch: 0x%x != 0x%x\n Kernel version: %s - did you forget to install a matching libsystem_kernel.dylib?\n Kernel UUID: %x%x%x%x-%x%x-%x%x-%x%x-%x%x%x%x%x%x",  *(unsigned __int8 *)(v48 + 274),  *(unsigned __int8 *)(v48 + 275),  *(unsigned __int8 *)(v48 + 276),  *(unsigned __int8 *)(v48 + 277),  *(unsigned __int8 *)(v48 + 278),  v49);
    qword_18C50D128 = (uint64_t)v70;
    __break(1u);
LABEL_104:
    qword_18C50D128 = (uint64_t)"nexus advisory metadata version mismatch";
    qword_18C50D158 = 1LL;
    __break(1u);
    goto LABEL_105;
  }

  *(_DWORD *)(v39 + 56) = *(_DWORD *)(v48 + 320);
  *(_DWORD *)(v39 + 60) = *(_DWORD *)(v48 + 324);
  uint64_t v50 = *(void *)(v48 + 328);
  if (v50) {
    *(void *)(v39 + 32) = *(void *)(*(void *)(v39 + 16) + 288LL) + v50;
  }
  uint64_t v51 = *(void *)(v48 + 304);
  if (v51) {
    *(void *)(v39 + 40) = *(void *)(*(void *)(v39 + 16) + 288LL) + v51;
  }
  uint64_t v52 = *(void *)(v48 + 344);
  if (!v52) {
    goto LABEL_74;
  }
  uint64_t v53 = *(void *)(*(void *)(v39 + 16) + 288LL) + v52;
  *(void *)(v39 + 48) = v53;
  if (*(_WORD *)v53 != 1 && (*(_DWORD *)(v48 + 4) & 0x80000000) != 0) {
    goto LABEL_104;
  }
  if (*(_DWORD *)(v53 + 4) == 2)
  {
    if (*(void *)(v53 + 8) != 1LL && (*(_DWORD *)(v48 + 4) & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"nexus advisory version mismatch for netif";
      qword_18C50D158 = 1LL;
      __break(1u);
      goto LABEL_58;
    }

    goto LABEL_74;
  }

  if (*(_DWORD *)(v53 + 4) == 1)
  {
    if (*(void *)(v53 + 8) == 2LL || (*(_DWORD *)(v48 + 4) & 0x80000000) == 0) {
      goto LABEL_74;
    }
    uint64_t v48 = 2LL;
    qword_18C50D128 = (uint64_t)"nexus advisory version mismatch for flowswitch";
    qword_18C50D158 = 2LL;
    __break(1u);
  }

  if ((*(_DWORD *)(v48 + 4) & 0x80000000) == 0)
  {
LABEL_74:
    if (a5) {
      os_channel_info2attr(v39, a5);
    }
    if (v73 - v75 != -1)
    {
      uint64_t v57 = 0LL;
      uint64_t v58 = v39 + 72;
      do
      {
        os_channel_init_ring(v58, v39, v57++);
        v58 += 96LL;
      }

      while (v44 != v57);
    }

    if (v78 - v74 != -1)
    {
      do
      {
        os_channel_init_ring(v39 + 96LL * v44 + 72, v39, v44);
        LODWORD(v44) = v44 + 1;
        --v45;
      }

      while (v45);
    }

    if ((_DWORD)v76)
    {
      unsigned int v59 = v73 + v78 - v75 - v74 + 2;
      uint64_t v60 = v76;
      do
      {
        os_channel_init_ring(v39 + 96LL * v59 + 72, v39, v59);
        ++v59;
        --v60;
      }

      while (v60);
    }

    if ((_DWORD)v80)
    {
      unsigned int v61 = v73 + v78 + v76 - v75 - v74 + 2;
      uint64_t v62 = v80;
      do
      {
        os_channel_init_ring(v39 + 96LL * v61 + 72, v39, v61);
        ++v61;
        --v62;
      }

      while (v62);
    }

    if ((_DWORD)v79)
    {
      uint64_t v63 = v79;
      unsigned int v64 = v73 + v78 + v80 + v76 - v75 - v74 + 2;
      do
      {
        os_channel_init_ring(v39 + 96LL * v64 + 72, v39, v64);
        ++v64;
        --v63;
      }

      while (v63);
    }

    if ((v82 & 8) != 0)
    {
      *(_DWORD *)(v39 + 4) = 3;
      *(_BYTE *)(v39 + 64) = v71;
      if (v76 < 3)
      {
        char v67 = v71 + 1;
        char v66 = -1;
        char v68 = -1;
      }

      else
      {
        *(_DWORD *)(v39 + 4) = 11;
        char v66 = v71 + 1;
        char v67 = v71 + 2;
        char v68 = v71 + 3;
      }

      *(_BYTE *)(v39 + 66) = v66;
      *(_BYTE *)(v39 + 65) = v67;
      *(_BYTE *)(v39 + 67) = v68;
      char v65 = v72;
      if (!(_DWORD)v79) {
        char v65 = -1;
      }
    }

    else
    {
      *(_DWORD *)(v39 + 64) = -1;
      char v65 = -1;
    }

    *(_BYTE *)(v39 + 68) = v65;
    if (!__os_ch_md_redzone_cookie) {
      __os_ch_md_redzone_cookie = *(void *)(*(void *)(v39 + 24) + 312LL);
    }
    __dmb(0xBu);
    return v39;
  }

LABEL_105:
  qword_18C50D128 = (uint64_t)"nexus advisory metadata type unknown";
  qword_18C50D158 = 1LL;
  __break(1u);
  return result;
}

double os_channel_info2attr(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = *(_DWORD *)(a2 + 36);
  uint64_t v6 = *(void *)(a2 + 40);
  (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(a2, 136LL);
  uint64_t v7 = *(void *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)(v7 + 152);
  *(void *)(a2 + 16) = *(void *)(v7 + 168);
  int v8 = *(_DWORD *)(v7 + 176);
  *(_DWORD *)(a2 + 80) = *(_DWORD *)(v7 + 196);
  unsigned int v9 = *(_DWORD *)(v4 + 16);
  *(_DWORD *)(a2 + 24) = v8;
  *(_DWORD *)(a2 + 28) = (v9 >> 9) & 1;
  *(_DWORD *)(a2 + 104) = (v9 >> 4) & 1;
  LODWORD(v7) = *(_DWORD *)(v7 + 208);
  *(_DWORD *)(a2 + 96) = (v9 >> 3) & 1;
  *(_DWORD *)(a2 + 100) = v7;
  if ((v9 & 4) != 0) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  if ((v9 & 3) == 0) {
    int v10 = 0;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(_DWORD *)(a2 + 36) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = *(void *)(v4 + 320);
  *(void *)(a2 + 56) = *(void *)(v4 + 328);
  uint64_t v11 = *(void *)(a1 + 16);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(v11 + 132);
  *(void *)(a2 + 68) = *(void *)(v11 + 184);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)(v11 + 192);
  double result = *(double *)(a1 + 56);
  *(double *)(a2 + 84) = result;
  unsigned int v13 = *(_DWORD *)(v4 + 16);
  *(_DWORD *)(a2 + 92) = *(_DWORD *)(v11 + 204) & 1;
  int v14 = *(_DWORD *)(v11 + 212);
  *(_DWORD *)(a2 + 112) = (v13 >> 6) & 1;
  *(_DWORD *)(a2 + 116) = v14;
  *(_DWORD *)(a2 + 120) = *(_DWORD *)(v4 + 276);
  *(_DWORD *)(a2 + 124) = (v13 >> 7) & 1;
  *(_DWORD *)(a2 + 128) = *(_DWORD *)(v11 + 220);
  return result;
}

uint64_t os_channel_init_ring(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  uint64_t v4 = v3 + 16LL * a3;
  uint64_t v6 = *(void *)(v4 + 352);
  uint64_t v5 = *(void *)(v4 + 360);
  uint64_t v7 = (void *)(v6 + v3);
  uint64_t v8 = v5 + v3;
  if (v6 + v3) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    qword_18C50D128 = (uint64_t)"Channel schema not valid";
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v5 = *(unsigned int *)(v3 + 320);
  uint64_t v6 = (v5 - 1);
  if (v6 >= 2)
  {
LABEL_9:
    qword_18C50D128 = (uint64_t)"Metadata type unknown";
    qword_18C50D158 = v5;
    __break(1u);
    goto LABEL_10;
  }

  uint64_t v6 = *(unsigned int *)(v3 + 324);
  if ((v6 - 1) < 2)
  {
    *(void *)double result = a2;
    *(void *)(result + 8) = v3 + 4;
    *(void *)(result + 16) = v7;
    *(void *)(result + 24) = v8;
    *(_DWORD *)(result + 32) = v5;
    *(_DWORD *)(result + 36) = v6;
    uint64_t v10 = *(void *)(a2 + 16);
    *(void *)(result + 40) = *(void *)(v10 + 288);
    *(void *)(result + 48) = (char *)v7 + v7[4];
    *(void *)(result + 64) = (char *)v7 + v7[6];
    *(void *)(result + 72) = (char *)v7 + v7[7];
    *(void *)(result + 80) = (char *)v7 + v7[8];
    *(void *)(result + 56) = (char *)v7 + v7[5];
    *(_DWORD *)(result + 88) = *(_DWORD *)(v10 + 212);
    return result;
  }

uint64_t os_channel_create(__int128 *a1, __int16 a2)
{
  return os_channel_create_extended(a1, a2, 0, -1, 0LL);
}

uint64_t os_channel_get_fd(unsigned int *a1)
{
  return *a1;
}

uint64_t os_channel_read_attr( void **a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t info = __channel_get_info((void *)*(unsigned int *)a1, a1[2], (void *)0x180, a4, a5, a6, a7, a8);
  if (!(_DWORD)info) {
    os_channel_info2attr((uint64_t)a1, a2);
  }
  return info;
}

uint64_t os_channel_write_attr( unsigned int *a1, _DWORD *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v10 = (_DWORD *)*((void *)a1 + 2);
  uint64_t v11 = a2 + 12;
  if (v10[80] != a2[12] || v10[81] != a2[13])
  {
    uint64_t result = __channel_set_opt((void *)*a1, (void *)1, v11, (void *)8, a5, a6, a7, a8);
    if ((_DWORD)result) {
      return result;
    }
    *(void *)(*((void *)a1 + 2) + 320LL) = *v11;
    uint64_t v10 = (_DWORD *)*((void *)a1 + 2);
  }

  if (v10[82] == a2[14] && v10[83] == a2[15]) {
    return 0LL;
  }
  uint64_t result = __channel_set_opt((void *)*a1, (void *)2, a2 + 14, (void *)8, a5, a6, a7, a8);
  if (!(_DWORD)result) {
    *(void *)(*((void *)a1 + 2) + 328LL) = *((void *)a2 + 7);
  }
  return result;
}

uint64_t os_channel_read_nexus_extension_info(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2) {
    *a2 = *(_DWORD *)(v3 + 132);
  }
  if (a3) {
    *a3 = *(unsigned int *)(v3 + 184);
  }
  return 0LL;
}

uint64_t os_channel_sync( unsigned int *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unsigned int v8 = a1[1];
  if ((_DWORD)a2) {
    unint64_t v9 = v8 & 0xFFFFFFF6;
  }
  else {
    unint64_t v9 = v8;
  }
  return __channel_sync((void *)*a1, a2, (void *)v9, a4, a5, a6, a7, a8);
}

uint64_t os_channel_destroy( unsigned int *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t v9 = (void *)*a1;
  if ((_DWORD)v9 != -1) {
    guarded_close_np(v9, a1 + 2, a3, a4, a5, a6, a7, a8);
  }
  uint64_t result = *((void *)a1 + 2);
  uint64_t v11 = _libkernel_functions;
  if (result)
  {
    uint64_t v12 = *(uint64_t (**)(void))(_libkernel_functions + 24);
    if (v12)
    {
      uint64_t result = v12();
      uint64_t v11 = _libkernel_functions;
    }

    *((void *)a1 + 2) = 0LL;
  }

  unsigned int v13 = *(uint64_t (**)(unsigned int *))(v11 + 24);
  if (v13) {
    return v13(a1);
  }
  return result;
}

BOOL os_channel_is_defunct(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 24) + 4LL) >= 0;
}

uint64_t os_channel_ring_id(uint64_t a1, int a2)
{
  mach_vm_size_t v2 = *(unsigned int **)(a1 + 16);
  switch(a2)
  {
    case 0:
      uint64_t result = v2[76];
      break;
    case 1:
      uint64_t result = v2[77];
      break;
    case 2:
      uint64_t result = v2[78];
      break;
    case 3:
      uint64_t result = v2[79];
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }

  return result;
}

uint64_t os_channel_tx_ring(uint64_t a1, unsigned int a2)
{
  mach_vm_size_t v2 = *(_DWORD **)(a1 + 16);
  int v3 = v2[5];
  BOOL v4 = v3 == -1 || v3 == a2;
  if (v4 && (unsigned int v5 = v2[76], v6 = a2 >= v5, v7 = a2 - v5, v6) && v2[77] >= a2) {
    return a1 + 96LL * v7 + 72;
  }
  else {
    return 0LL;
  }
}

uint64_t os_channel_rx_ring(uint64_t a1, unsigned int a2)
{
  mach_vm_size_t v2 = *(_DWORD **)(a1 + 16);
  int v3 = v2[5];
  BOOL v4 = v3 == -1 || v3 == a2;
  if (v4 && (unsigned int v5 = v2[78], v5 <= a2) && v2[79] >= a2) {
    return a1 + 96LL * (a2 - (v5 + v2[76]) + v2[77] + 1) + 72;
  }
  else {
    return 0LL;
  }
}

BOOL os_channel_pending(uint64_t a1)
{
  return **(_DWORD **)(a1 + 16) != *(_DWORD *)(*(void *)(a1 + 16) + 8LL);
}

uint64_t os_channel_ring_sync_time(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 16) + 72LL);
}

uint64_t os_channel_ring_notify_time(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 16) + 80LL);
}

uint64_t os_channel_available_slot_count(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (*(_WORD *)(v1 + 30) == 1)
  {
    int v2 = *(_DWORD *)v1 - *(_DWORD *)(v1 + 8);
    int v3 = *(_DWORD *)(v1 + 12);
    int v4 = ~(v2 + (v3 & (v2 >> 31)));
LABEL_5:
    v4 += v3;
    return v4 & (**(int **)(a1 + 8) >> 31);
  }

  int v4 = *(_DWORD *)(v1 + 4) - *(_DWORD *)v1;
  if (v4 < 0)
  {
    int v3 = *(_DWORD *)(v1 + 12);
    goto LABEL_5;
  }

  return v4 & (**(int **)(a1 + 8) >> 31);
}

uint64_t os_channel_advance_slot(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD **)(a1 + 16);
  unint64_t v3 = (unint64_t)(a2 - *(void *)(a1 + 24)) >> 3;
  if (*v2 <= v2[1])
  {
    unsigned int v4 = v2[1];
LABEL_7:
LABEL_12:
    else {
      return 6LL;
    }
  }

  if (v2[1] <= v3)
  {
    unsigned int v4 = v2[3];
    goto LABEL_7;
  }

LABEL_8:
  uint64_t result = 0LL;
  if ((_DWORD)v3 + 1 == v2[3]) {
    int v6 = 0;
  }
  else {
    int v6 = v3 + 1;
  }
  _DWORD *v2 = v6;
  return result;
}

uint64_t os_channel_get_next_slot(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = *(unsigned int **)(result + 16);
  if (!a2)
  {
    unsigned int v8 = *v5;
    goto LABEL_14;
  }

  unint64_t v6 = a2 - *(void *)(result + 24);
  unint64_t v7 = v6 >> 3;
  unsigned int v8 = v5[1];
  if (*v5 <= v8)
  {
    uint64_t v9 = *v5;
    uint64_t v9 = v5[1];
    goto LABEL_8;
  }

  uint64_t v9 = *v5;
  if (v9 <= v7)
  {
    uint64_t v9 = v5[3];
LABEL_8:
    if (v9 > v7)
    {
LABEL_9:
      if ((_DWORD)v7 + 1 == v5[3]) {
        unsigned int v8 = 0;
      }
      else {
        unsigned int v8 = v7 + 1;
      }
      goto LABEL_14;
    }
  }

LABEL_20:
    if (*(_DWORD *)(result + 32) == 2)
    {
      unint64_t v6 = *((unsigned __int16 *)v4 + 77);
      uint64_t v16 = *((unsigned __int16 *)v4 + 76);
      if (*((_WORD *)v4 + 77)) {
        BOOL v17 = (_DWORD)v16 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        if (*(_DWORD *)(result + 88) >= v16)
        {
          if (v6 <= v16)
          {
            if (*((_DWORD *)v4 + 13) != -1)
            {
              uint64_t v10 = v4 + 4;
              goto LABEL_29;
            }

            goto LABEL_72;
          }

  uint64_t v9 = *(int **)(result + 8);
  if (*v9 < 0)
  {
    unsigned int v8 = a2;
    qword_18C50D128 = (uint64_t)"Slot has attached packet";
    qword_18C50D158 = a2;
    __break(1u);
LABEL_22:
    if ((**(_DWORD **)(result + 8) & 0x80000000) == 0) {
      goto LABEL_12;
    }
    qword_18C50D128 = (uint64_t)"bad packet handle";
    qword_18C50D158 = v8;
    __break(1u);
LABEL_24:
    qword_18C50D128 = (uint64_t)"Invalid slot";
    qword_18C50D158 = a2;
    __break(1u);
    return result;
  }

  v31 |= 0x10u;
  if ((v26 & 0x80) == 0)
  {
LABEL_9:
    if ((v26 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }

      mach_msg_destroy(&v13);
      return v10;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v10;
}

      mach_msg_destroy(&v15);
      return v13;
    }

    mig_dealloc_reply_port(v15.msgh_local_port);
  }

  return v13;
}

      mach_msg_destroy(&v12);
      return v10;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v10;
}

      mach_msg_destroy(&v12);
      return v10;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v10;
}

      mach_msg_destroy(&v14);
      return v9;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v9;
}

      mach_msg_destroy(&v13);
      return v11;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v11;
}

      mach_msg_destroy(&v13);
      return v10;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v10;
}

      mach_msg_destroy(&v18);
      return v15;
    }

    mig_dealloc_reply_port(v18.msgh_local_port);
  }

  return v15;
}

      mach_msg_destroy(&v20);
      return v16;
    }

    mig_dealloc_reply_port(v20.msgh_local_port);
  }

  return v16;
}

      mach_msg_destroy(&v21);
      return v17;
    }

    mig_dealloc_reply_port(v21.msgh_local_port);
  }

  return v17;
}

      mach_msg_destroy(&v11);
      return v9;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v9;
}

      mach_msg_destroy(&v18);
      return v15;
    }

    mig_dealloc_reply_port(v18.msgh_local_port);
  }

  return v15;
}

      mach_msg_destroy(&v20);
      return v16;
    }

    mig_dealloc_reply_port(v20.msgh_local_port);
  }

  return v16;
}

      mach_msg_destroy(&v21);
      return v17;
    }

    mig_dealloc_reply_port(v21.msgh_local_port);
  }

  return v17;
}

LABEL_71:
          qword_18C50D128 = (uint64_t)"Invalid bufcnt";
          qword_18C50D158 = v6;
          __break(1u);
LABEL_72:
          uint64_t v10 = (void *)*((unsigned int *)v4 + 14);
          if ((_DWORD)v10 != -1)
          {
            uint64_t v10 = (void *)(*(void *)(result + 80) + v10 * *((unsigned __int16 *)v5 + 13));
            if (v10)
            {
LABEL_78:
              v4[4] = v10;
              v4[5] = 0LL;
LABEL_29:
              int v18 = 0;
              int v19 = v10;
              do
              {
                int v20 = *((_DWORD *)v19 + 5);
                if (v20 == -1)
                {
                  uint64_t v25 = 0LL;
                }

                else
                {
                  __int16 v21 = *((_WORD *)v19 + 20);
                  BOOL v22 = (v21 & 2) == 0;
                  if ((v21 & 2) != 0) {
                    uint64_t v23 = 5LL;
                  }
                  else {
                    uint64_t v23 = 4LL;
                  }
                  if (v22) {
                    uint64_t v24 = 48LL;
                  }
                  else {
                    uint64_t v24 = 56LL;
                  }
                  uint64_t v25 = *(void *)(result + v24) + v5[v23] * v20;
                }

                v19[1] = v25;
                int v26 = *((_DWORD *)v19 + 6);
                if (v26 == -1)
                {
                  *int v19 = 0LL;
                  if (v18 + 1 != (_DWORD)v6) {
                    goto LABEL_75;
                  }
                  goto LABEL_49;
                }

                uint64_t v27 = (void *)(*(void *)(result + 80) + v26 * *((unsigned __int16 *)v5 + 13));
                *int v19 = v27;
                int v19 = v27;
              }

              while (v27);
              unint64_t v6 = **(unsigned int **)(result + 8);
              if ((v6 & 0x80000000) != 0) {
                goto LABEL_77;
              }
              return 0LL;
            }
          }

          qword_18C50D128 = (uint64_t)"bad packet: no buflet";
          __break(1u);
LABEL_75:
          qword_18C50D128 = (uint64_t)"invalid buflet count";
          qword_18C50D158 = v6;
          __break(1u);
LABEL_76:
          unint64_t v6 = (v6 >> 3);
          qword_18C50D128 = (uint64_t)"Index out of bounds in gns";
          qword_18C50D158 = v6;
          __break(1u);
LABEL_77:
          qword_18C50D128 = (uint64_t)"non terminating buflet chain";
          __break(1u);
          goto LABEL_78;
        }

LABEL_70:
        unint64_t v6 = v16;
        qword_18C50D128 = (uint64_t)"Invalid max bufcnt";
        qword_18C50D158 = v16;
        __break(1u);
        goto LABEL_71;
      }

      if ((**(_DWORD **)(result + 8) & 0x80000000) != 0)
      {
        qword_18C50D128 = (uint64_t)"bad bufcnt";
        __break(1u);
        goto LABEL_70;
      }
    }

    else
    {
      uint64_t v10 = v4 + 4;
      uint64_t v28 = 5LL;
      uint64_t v29 = 56LL;
      if ((v4[9] & 2) == 0) {
        uint64_t v29 = 48LL;
      }
      uint64_t v30 = *(void *)(result + v29);
      if ((v4[9] & 2) == 0) {
        uint64_t v28 = 4LL;
      }
      v4[5] = v30 + v5[v28] * *((_DWORD *)v4 + 13);
LABEL_49:
      uint64_t v31 = v10[1];
      if (v31)
      {
        if (a3)
        {
          uint64_t v32 = *((unsigned __int16 *)v10 + 16);
          *(_DWORD *)(a3 + 4) = v8;
          *(_WORD *)a3 = 0;
          *(void *)(a3 + 16) = v31 + v32;
          *(void *)(a3 + 24) = v4;
          int v33 = v5 + 4;
          if (v3 != 1) {
            int v33 = v4 + 2;
          }
          *(_WORD *)(a3 + 2) = *v33;
        }

        goto LABEL_54;
      }
    }

    return 0LL;
  }

LABEL_65:
  if ((*(_WORD *)(v9 + 4) & 1) != 0)
  {
    qword_18C50D128 = (uint64_t)"Tx slot has attached metadata";
    qword_18C50D158 = v8;
    __break(1u);
    return result;
  }

  if (a3)
  {
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0LL;
    *(void *)(a3 + 24) = 0LL;
  }

LABEL_54:
  else {
    return 0LL;
  }
}

uint64_t os_channel_set_slot_properties(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 16);
  uint64_t v4 = *(void *)(result + 24);
  unint64_t v5 = a2 - v4;
  unint64_t v6 = (unint64_t)(a2 - v4) >> 3;
  if (*(_DWORD *)v3 <= *(_DWORD *)(v3 + 4))
  {
    unsigned int v7 = *(_DWORD *)(v3 + 4);
    goto LABEL_7;
  }

  if (*(_DWORD *)(v3 + 4) > v6)
  {
LABEL_8:
    uint64_t v8 = *(void *)(a3 + 24);
    uint64_t v9 = *(void *)(v8 - 16);
    uint64_t v10 = *(void *)(result + 64);
    if (v9 == ((v8 - v10) ^ __os_ch_md_redzone_cookie) || (**(_DWORD **)(result + 8) & 0x80000000) == 0)
    {
      uint64_t v9 = v4 + (v5 & 0x7FFFFFFF8LL);
      if ((*(_WORD *)(v9 + 4) & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
      qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
      qword_18C50D158 = v9;
      __break(1u);
    }

    unint64_t v5 = **(unsigned int **)(result + 8);
    if ((v5 & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
      __break(1u);
      goto LABEL_17;
    }

LABEL_11:
  if ((**(_DWORD **)(result + 8) & 0x80000000) != 0)
  {
LABEL_17:
    qword_18C50D128 = (uint64_t)"Index out of bounds in ssp";
    qword_18C50D158 = (v5 >> 3);
    __break(1u);
  }

  return result;
}

unint64_t os_channel_slot_get_packet(unint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(result + 24);
  unint64_t v4 = a2 - v3;
  unint64_t v5 = (unint64_t)(a2 - v3) >> 3;
  if (*(_DWORD *)v2 <= *(_DWORD *)(v2 + 4))
  {
    unsigned int v6 = *(_DWORD *)(v2 + 4);
  }

  else
  {
    unsigned int v6 = *(_DWORD *)(v2 + 12);
  }

LABEL_9:
  if ((**(_DWORD **)(result + 8) & 0x80000000) == 0)
  {
LABEL_10:
    uint64_t v7 = v3 + (v4 & 0x7FFFFFFF8LL);
    if ((*(_WORD *)(v7 + 4) & 1) == 0) {
      return 0LL;
    }
    uint64_t v8 = *(void *)(result + 64);
    int v9 = *(unsigned __int16 *)(v2 + 24);
    uint64_t v10 = v8 + (*(_DWORD *)v7 * v9);
    uint64_t v12 = v10 + 16;
    uint64_t v11 = *(void *)v10;
    if (*(void *)v10 == ((v10 + 16 - v8) ^ __os_ch_md_redzone_cookie)
      || (**(_DWORD **)(result + 8) & 0x80000000) == 0)
    {
      uint64_t v11 = *(unsigned int *)(v10 + 8);
    }

    else
    {
      qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
      qword_18C50D158 = v11;
      __break(1u);
    }

    unint64_t v4 = **(unsigned int **)(result + 8);
    if ((v4 & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"bad packet handle";
      qword_18C50D158 = v11;
      __break(1u);
      goto LABEL_21;
    }

LABEL_13:
    if (v10 != -16) {
      return v12 & 0xFFFFFFFFFFFFFFF0LL | *(_DWORD *)(result + 32) & 3LL | (4 * (*(_DWORD *)(result + 36) & 3LL));
    }
    return 0LL;
  }

  uint64_t v8 = *(int **)(result + 8);
  if (*v8 < 0)
  {
LABEL_24:
    qword_18C50D128 = (uint64_t)"Invalid slot";
    qword_18C50D158 = a2;
    __break(1u);
    return result;
  }

LABEL_21:
  qword_18C50D128 = (uint64_t)"Index out of bounds in sgp";
  qword_18C50D158 = (v4 >> 3);
  __break(1u);
  return result;
}

  v31 |= 0x80u;
  if ((v26 & 0x100) == 0)
  {
LABEL_10:
    if ((v26 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }

      mach_msg_destroy(&v14);
      return v11;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v11;
}

      mach_msg_destroy(&v14);
      return v11;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v11;
}

      mach_msg_destroy(&v14);
      return v12;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v12;
}

      mach_msg_destroy(&v14);
      return v12;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v12;
}

uint64_t os_channel_get_stats_region(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (*(_DWORD *)(*(void *)(a1 + 24) + 336LL) == 1)
    {
      switch(a2)
      {
        case 0:
          return result;
        case 1:
          result += 336LL;
          break;
        case 2:
          result += 624LL;
          break;
        case 3:
          result += 2336LL;
          break;
        case 4:
          result += 2512LL;
          break;
        default:
          return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t os_channel_get_advisory_region(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (!v1) {
    return 0LL;
  }
  int v2 = *(_DWORD *)(v1 + 4);
  uint64_t v3 = v1 + 8;
  if (v2 == 1) {
    return v3;
  }
  else {
    return 0LL;
  }
}

uint64_t os_channel_flow_admissible(void *a1, unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(*a1 + 40LL);
  if (!v3) {
    return 6LL;
  }
  if (*(_WORD *)(a1[2] + 30LL) != 1 || *(_DWORD *)(*(void *)(*a1 + 16LL) + 196LL) <= a3) {
    return 22LL;
  }
  unint64_t v4 = (unsigned __int8 *)(v3 + 32LL * a3);
  unint64_t v5 = v4 + 24;
  if (*((_DWORD *)v4 + 6))
  {
    if ((a2 & 7) == 0)
    {
      if (*(void *)v4 == *(void *)a2 && *((void *)v4 + 1) == *((void *)a2 + 1)) {
        return ((int)(*v5 << 30) >> 31) & 0x37;
      }
      return 2LL;
    }

    if ((a2 & 3) != 0)
    {
      if (*v4 == *a2
        && v4[1] == a2[1]
        && v4[2] == a2[2]
        && v4[3] == a2[3]
        && v4[4] == a2[4]
        && v4[5] == a2[5]
        && v4[6] == a2[6]
        && v4[7] == a2[7]
        && v4[8] == a2[8]
        && v4[9] == a2[9]
        && v4[10] == a2[10]
        && v4[11] == a2[11]
        && v4[12] == a2[12]
        && v4[13] == a2[13]
        && v4[14] == a2[14])
      {
        int v7 = v4[15];
        int v8 = a2[15];
LABEL_16:
        if (v7 == v8) {
          return ((int)(*v5 << 30) >> 31) & 0x37;
        }
      }
    }

    else if (*(_DWORD *)v4 == *(_DWORD *)a2 {
           && *((_DWORD *)v4 + 1) == *((_DWORD *)a2 + 1)
    }
           && *((_DWORD *)v4 + 2) == *((_DWORD *)a2 + 2))
    {
      int v7 = *((_DWORD *)v4 + 3);
      int v8 = *((_DWORD *)a2 + 3);
      goto LABEL_16;
    }
  }

  return 2LL;
}

uint64_t os_channel_flow_adv_get_ce_count( void *a1, unsigned __int8 *a2, unsigned int a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v5 = *(void *)(*a1 + 40LL);
  if (!v5) {
    return 6LL;
  }
  if (*(_WORD *)(a1[2] + 30LL) != 1 || *(_DWORD *)(*(void *)(*a1 + 16LL) + 196LL) <= a3) {
    return 22LL;
  }
  unsigned int v6 = (unsigned __int8 *)(v5 + 32LL * a3);
  if (*((_DWORD *)v6 + 6))
  {
    if ((a2 & 7) == 0)
    {
      if (*(void *)v6 == *(void *)a2 && *((void *)v6 + 1) == *((void *)a2 + 1)) {
        goto LABEL_8;
      }
      return 2LL;
    }

    if ((a2 & 3) != 0)
    {
      if (*v6 == *a2
        && v6[1] == a2[1]
        && v6[2] == a2[2]
        && v6[3] == a2[3]
        && v6[4] == a2[4]
        && v6[5] == a2[5]
        && v6[6] == a2[6]
        && v6[7] == a2[7]
        && v6[8] == a2[8]
        && v6[9] == a2[9]
        && v6[10] == a2[10]
        && v6[11] == a2[11]
        && v6[12] == a2[12]
        && v6[13] == a2[13]
        && v6[14] == a2[14])
      {
        int v9 = v6[15];
        int v10 = a2[15];
LABEL_16:
        if (v9 == v10)
        {
LABEL_8:
          uint64_t result = 0LL;
          uint64_t v8 = v5 + 32LL * a3;
          *a4 = *(_DWORD *)(v8 + 16);
          *a5 = *(_DWORD *)(v8 + 20);
          return result;
        }
      }
    }

    else if (*(_DWORD *)v6 == *(_DWORD *)a2 {
           && *((_DWORD *)v6 + 1) == *((_DWORD *)a2 + 1)
    }
           && *((_DWORD *)v6 + 2) == *((_DWORD *)a2 + 2))
    {
      int v9 = *((_DWORD *)v6 + 3);
      int v10 = *((_DWORD *)a2 + 3);
      goto LABEL_16;
    }
  }

  return 2LL;
}

uint64_t os_channel_attr_create()
{
  uint64_t v0 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0(136LL);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v1, 136LL);
  }
  return v2;
}

uint64_t os_channel_attr_clone(__int128 *a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t v3 = v1(136LL);
  uint64_t v4 = v3;
  if (v3)
  {
    (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v3, 136LL);
    if (a1)
    {
      __int128 v5 = a1[3];
      __int128 v6 = a1[4];
      __int128 v7 = a1[1];
      *(_OWORD *)(v4 + 32) = a1[2];
      __int128 v8 = *a1;
      *(_OWORD *)(v4 + 48) = v5;
      *(_OWORD *)(v4 + 64) = v6;
      *(_OWORD *)uint64_t v4 = v8;
      *(_OWORD *)(v4 + 16) = v7;
      __int128 v9 = a1[5];
      __int128 v10 = a1[6];
      __int128 v11 = a1[7];
      *(void *)(v4 + 128) = *((void *)a1 + 16);
      *(_OWORD *)(v4 + 96) = v10;
      *(_OWORD *)(v4 + 112) = v11;
      *(_OWORD *)(v4 + 80) = v9;
      *(void *)(v4 + 40) = 0LL;
      *(_DWORD *)(v4 + 36) = 0;
      uint64_t v12 = (const void *)*((void *)a1 + 5);
      if (v12)
      {
        unsigned int v13 = *((_DWORD *)a1 + 9);
        if (v13)
        {
          if (os_channel_attr_set_key(v4, v12, v13))
          {
            uint64_t v14 = _libkernel_functions;
            if (*(void *)(v4 + 40))
            {
              uint64_t v15 = *(void (**)(void))(_libkernel_functions + 24);
              if (v15)
              {
                v15();
                uint64_t v14 = _libkernel_functions;
              }

              *(void *)(v4 + 40) = 0LL;
            }

            uint64_t v16 = *(void (**)(uint64_t))(v14 + 24);
            if (v16) {
              v16(v4);
            }
            return 0LL;
          }
        }
      }
    }
  }

  return v4;
}

uint64_t os_channel_attr_set_key(uint64_t a1, const void *a2, unsigned int a3)
{
  if (!a2 && a3) {
    return 22LL;
  }
  if (a2) {
    BOOL v7 = a3 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  uint64_t result = 22LL;
  if (a3 <= 0x400 && (v8 & 1) == 0)
  {
    *(_DWORD *)(a1 + 36) = 0;
    if (a3)
    {
      if (!a2) {
        return 0LL;
      }
      uint64_t v9 = _libkernel_functions;
      if (*(void *)(a1 + 40))
      {
        __int128 v10 = *(void (**)(void))(_libkernel_functions + 24);
        if (v10)
        {
          v10();
          uint64_t v9 = _libkernel_functions;
        }
      }

      __int128 v11 = *(uint64_t (**)(void))(v9 + 16);
      if (v11)
      {
        uint64_t v12 = (void *)v11(a3);
        *(void *)(a1 + 40) = v12;
        if (v12)
        {
          *(_DWORD *)(a1 + 36) = a3;
          memmove(v12, a2, a3);
          return 0LL;
        }
      }

      else
      {
        *(void *)(a1 + 40) = 0LL;
      }

      return 12LL;
    }

    else
    {
      uint64_t result = *(void *)(a1 + 40);
      if (result)
      {
        unsigned int v13 = *(void (**)(void))(_libkernel_functions + 24);
        if (v13) {
          v13();
        }
        uint64_t result = 0LL;
        *(void *)(a1 + 40) = 0LL;
      }
    }
  }

  return result;
}

uint64_t os_channel_attr_destroy(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  uint64_t v3 = _libkernel_functions;
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(_libkernel_functions + 24);
    if (v4)
    {
      uint64_t result = v4();
      uint64_t v3 = _libkernel_functions;
    }

    *(void *)(a1 + 40) = 0LL;
  }

  __int128 v5 = *(uint64_t (**)(uint64_t))(v3 + 24);
  if (v5) {
    return v5(a1);
  }
  return result;
}

uint64_t os_channel_attr_set(_DWORD *a1, int a2, unint64_t a3)
{
  uint64_t result = 45LL;
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 14:
    case 15:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 25:
    case 29:
    case 30:
    case 32:
      return result;
    case 6:
      uint64_t result = 0LL;
      a1[7] = a3;
      break;
    case 7:
      if (a3) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = 45LL;
      }
      break;
    case 8:
      if (a3 > 2) {
        goto LABEL_11;
      }
      uint64_t result = 0LL;
      a1[8] = a3;
      break;
    case 9:
    case 11:
      if (a3 > 1) {
        goto LABEL_11;
      }
      uint64_t result = 0LL;
      if (a2 == 9) {
        a1[12] = a3;
      }
      else {
        a1[14] = a3;
      }
      break;
    case 10:
      uint64_t result = 0LL;
      a1[13] = a3;
      break;
    case 12:
      uint64_t result = 0LL;
      a1[15] = a3;
      break;
    case 24:
      uint64_t result = 0LL;
      a1[24] = a3 != 0;
      break;
    case 26:
      uint64_t result = 0LL;
      a1[26] = a3 != 0;
      break;
    case 27:
      uint64_t result = 0LL;
      a1[27] = a3;
      break;
    case 28:
      uint64_t result = 0LL;
      a1[28] = a3 != 0;
      break;
    case 31:
      uint64_t result = 0LL;
      a1[31] = a3 != 0;
      break;
    default:
LABEL_11:
      uint64_t result = 22LL;
      break;
  }

  return result;
}

uint64_t os_channel_attr_get(unsigned int *a1, int a2, uint64_t *a3)
{
  uint64_t v3 = 22LL;
  uint64_t v4 = 1LL;
  switch(a2)
  {
    case 0:
      uint64_t v4 = *a1;
      goto LABEL_32;
    case 1:
      uint64_t v4 = a1[1];
      goto LABEL_32;
    case 2:
      uint64_t v4 = a1[2];
      goto LABEL_32;
    case 3:
      uint64_t v4 = a1[3];
      goto LABEL_32;
    case 4:
      uint64_t v4 = a1[4];
      goto LABEL_32;
    case 5:
      uint64_t v4 = a1[5];
      goto LABEL_32;
    case 6:
      uint64_t v4 = a1[7];
      goto LABEL_32;
    case 7:
      goto LABEL_32;
    case 8:
      uint64_t v4 = a1[8];
      goto LABEL_32;
    case 9:
      uint64_t v4 = a1[12];
      goto LABEL_32;
    case 10:
      uint64_t v4 = a1[13];
      goto LABEL_32;
    case 11:
      uint64_t v4 = a1[14];
      goto LABEL_32;
    case 12:
      uint64_t v4 = a1[15];
      goto LABEL_32;
    case 13:
      uint64_t v4 = a1[16];
      goto LABEL_32;
    case 14:
      uint64_t v4 = a1[17];
      goto LABEL_32;
    case 15:
      uint64_t v4 = a1[18];
      goto LABEL_32;
    case 18:
      uint64_t v4 = a1[19];
      goto LABEL_32;
    case 19:
      uint64_t v4 = a1[6];
      goto LABEL_32;
    case 20:
      uint64_t v4 = a1[20];
      goto LABEL_32;
    case 21:
      uint64_t v4 = a1[21];
      goto LABEL_32;
    case 22:
      uint64_t v4 = a1[22];
      goto LABEL_32;
    case 23:
      uint64_t v4 = a1[23];
      goto LABEL_32;
    case 24:
      unsigned int v5 = a1[24];
      goto LABEL_30;
    case 25:
      uint64_t v4 = a1[25];
      goto LABEL_32;
    case 26:
      uint64_t v4 = a1[26];
      goto LABEL_32;
    case 28:
      unsigned int v5 = a1[28];
      goto LABEL_30;
    case 29:
      uint64_t v4 = a1[29];
      goto LABEL_32;
    case 30:
      uint64_t v4 = a1[30];
      goto LABEL_32;
    case 31:
      unsigned int v5 = a1[31];
LABEL_30:
      uint64_t v4 = v5 != 0;
      goto LABEL_32;
    case 32:
      uint64_t v4 = a1[32];
LABEL_32:
      uint64_t v3 = 0LL;
      *a3 = v4;
      break;
    default:
      return v3;
  }

  return v3;
}

uint64_t os_channel_attr_get_key(uint64_t a1, void *__dst, _DWORD *a3)
{
  if (!a3) {
    return 22LL;
  }
  uint64_t v4 = *(const void **)(a1 + 40);
  if (__dst)
  {
    if (v4)
    {
      unsigned int v5 = (_DWORD *)(a1 + 36);
      if (*a3 < *(_DWORD *)(a1 + 36)) {
        return 12LL;
      }
      memmove(__dst, v4, *(unsigned int *)(a1 + 36));
      goto LABEL_10;
    }
  }

  else if (v4)
  {
    unsigned int v5 = (_DWORD *)(a1 + 36);
LABEL_10:
    LODWORD(v4) = *v5;
  }

  uint64_t result = 0LL;
  *a3 = (_DWORD)v4;
  return result;
}

uint64_t os_channel_packet_alloc( unsigned int *a1, unint64_t *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return os_channel_packet_alloc_common(a1, a2, 0, a4, a5, a6, a7, a8);
}

uint64_t os_channel_packet_alloc_common( unsigned int *a1, unint64_t *a2, int a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((*(_BYTE *)(*((void *)a1 + 2) + 16LL) & 8) == 0) {
    return 45LL;
  }
  if (!a3)
  {
    LODWORD(v11) = *((unsigned __int8 *)a1 + 64);
    int v18 = &a1[24 * *((unsigned __int8 *)a1 + 64)];
    int v19 = (unsigned int *)*((void *)v18 + 11);
    uint64_t v14 = (uint64_t *)(v18 + 22);
    unsigned int v13 = v19;
    unsigned int v16 = *v19;
    if (*v19 == v19[1]) {
      goto LABEL_55;
    }
    goto LABEL_7;
  }

  uint64_t v11 = *((unsigned __int8 *)a1 + 68);
  if (v11 == 255) {
    return 45LL;
  }
  uint64_t v12 = &a1[24 * *((unsigned __int8 *)a1 + 68)];
  uint64_t v15 = (unsigned int *)*((void *)v12 + 11);
  uint64_t v14 = (uint64_t *)(v12 + 22);
  unsigned int v13 = v15;
  unsigned int v16 = *v15;
  if (*v15 != v15[1]) {
    goto LABEL_7;
  }
  for (uint64_t i = (void *)(a1[1] & 0xFFFFFFE6 | 0x10); ; uint64_t i = (void *)(a1[1] & 0xFFFFFFF7))
  {
    uint64_t result = __channel_sync((void *)*a1, (void *)2, i, a4, a5, a6, a7, a8);
    if ((_DWORD)result)
    {
      if ((*(_DWORD *)(*((void *)a1 + 3) + 4LL) & 0x80000000) != 0)
      {
        qword_18C50D128 = (uint64_t)"packet pool alloc sync failed";
        qword_18C50D158 = (int)result;
        __break(1u);
        goto LABEL_59;
      }

      return result;
    }

LABEL_63:
          int v33 = (void *)*(unsigned int *)(v8 + 56);
          if ((_DWORD)v33 == -1
            || (int v33 = (void *)(*(void *)&a1[24 * v11 + 38]
                               + v33 * *(unsigned __int16 *)(v29 + 26))) == 0LL)
          {
            qword_18C50D128 = (uint64_t)"bad packet: no buflet";
            __break(1u);
LABEL_66:
            qword_18C50D128 = (uint64_t)"invalid buflet count";
            qword_18C50D158 = v30;
            __break(1u);
LABEL_67:
            qword_18C50D128 = (uint64_t)"non terminating buflet chain";
            __break(1u);
          }

          *(void *)(v8 + 32) = v33;
          *(void *)(v8 + 40) = 0LL;
          goto LABEL_19;
        }

LABEL_62:
        qword_18C50D128 = (uint64_t)"Invalid bufcnt";
        qword_18C50D158 = v30;
        __break(1u);
        goto LABEL_63;
      }

LABEL_61:
      uint64_t v30 = v31;
      qword_18C50D128 = (uint64_t)"Invalid max bufcnt";
      qword_18C50D158 = v31;
      __break(1u);
      goto LABEL_62;
    }

LABEL_59:
    qword_18C50D128 = (uint64_t)"bad bufcnt";
    __break(1u);
    goto LABEL_61;
  }

  int v33 = (void *)(v8 + 32);
  uint64_t v47 = &a1[24 * v11];
  uint64_t v48 = v47 + 30;
  unsigned int v49 = v47 + 32;
  uint64_t v50 = 20LL;
  if ((*(_WORD *)(v8 + 72) & 2) == 0)
  {
    uint64_t v50 = 16LL;
    unsigned int v49 = v48;
  }

  *(void *)(v8 + 40) = *v49 + (*(_DWORD *)(v29 + v50) * *(_DWORD *)(v8 + 52));
LABEL_37:
  uint64_t result = 6LL;
  if (v33[1])
  {
    if (v16 + 1 == v13[3]) {
      unsigned int v52 = 0;
    }
    else {
      unsigned int v52 = v16 + 1;
    }
    *unsigned int v13 = v52;
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t os_channel_large_packet_alloc( unsigned int *a1, unint64_t *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return os_channel_packet_alloc_common(a1, a2, 1, a4, a5, a6, a7, a8);
}

uint64_t os_channel_packet_free( uint64_t result, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((*(_BYTE *)(*(void *)(result + 16) + 16LL) & 8) == 0) {
    return 45LL;
  }
  uint64_t v9 = result;
  unsigned int v10 = *(unsigned __int8 *)(result + 65);
  uint64_t v11 = result + 96LL * *(unsigned __int8 *)(result + 65);
  uint64_t v14 = *(unsigned int **)(v11 + 88);
  uint64_t v13 = v11 + 88;
  uint64_t v12 = v14;
  uint64_t v15 = *v14;
  if ((_DWORD)v15 == v14[1]
    && (uint64_t result = __channel_sync((void *)*(unsigned int *)result, (void *)2, (void *)2, a4, a5, a6, a7, a8),
        (_DWORD)result)
    && (*(_DWORD *)(*(void *)(v9 + 24) + 4LL) & 0x80000000) != 0)
  {
    qword_18C50D128 = (uint64_t)"packet pool free sync failed";
    qword_18C50D158 = (int)result;
    __break(1u);
  }

  else if ((_DWORD)v15 != v12[1])
  {
    goto LABEL_4;
  }

  uint64_t v16 = *(unsigned int *)(*(void *)(v9 + 24) + 4LL);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_4:
    uint64_t v16 = *(unsigned int *)((a2 & 0xFFFFFFFFFFFFFFF0LL) - 8);
    if ((a2 & 0xFFFFFFFFFFFFFFF0LL) == *(void *)(v9 + 96LL * v10 + 136)
                                      + v16 * *(unsigned __int16 *)(*(void *)v13 + 24LL)
                                      + 16LL)
      goto LABEL_5;
    goto LABEL_17;
  }

  qword_18C50D128 = (uint64_t)"no free ring space";
  __break(1u);
LABEL_17:
  if ((**(_DWORD **)(v9 + 96LL * v10 + 80) & 0x80000000) != 0)
  {
    qword_18C50D128 = (uint64_t)"bad packet handle";
    qword_18C50D158 = v16;
    __break(1u);
    return result;
  }

LABEL_5:
  uint64_t v17 = v9 + 96LL * v10;
  *(_DWORD *)(*(void *)(v17 + 96) + 8 * v15) = v16;
  *(_WORD *)(*(void *)(v17 + 96) + 8 * v15 + 4) |= 1u;
  if ((_DWORD)v15 + 1 == v12[3]) {
    int v18 = 0;
  }
  else {
    int v18 = v15 + 1;
  }
  *uint64_t v12 = v18;
  else {
    return 0LL;
  }
}

uint64_t os_channel_slot_attach_packet(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(*(void *)(*(void *)result + 16LL) + 16LL) & 8) == 0) {
    return 45LL;
  }
  unint64_t v4 = a3 & 0xFFFFFFFFFFFFFFF0LL;
  if ((*(_WORD *)((a3 & 0xFFFFFFFFFFFFFFF0LL) + 0x18) & 1) == 0)
  {
    uint64_t v9 = *(int **)(result + 8);
    if ((*v9 & 0x80000000) == 0) {
      goto LABEL_14;
    }
    qword_18C50D128 = (uint64_t)"packet not finalized";
    __break(1u);
    goto LABEL_20;
  }

  uint64_t v5 = *(void *)(result + 16);
  unint64_t v6 = (unint64_t)(a2 - *(void *)(result + 24)) >> 3;
  if (*(_DWORD *)v5 <= *(_DWORD *)(v5 + 4))
  {
    unsigned int v7 = *(_DWORD *)(v5 + 4);
  }

  else
  {
    if (*(_DWORD *)v5 > v6)
    {
LABEL_13:
      uint64_t v9 = *(int **)(result + 8);
      if (*v9 < 0) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }

    unsigned int v7 = *(_DWORD *)(v5 + 12);
  }

LABEL_14:
  if (*v9 >= 0) {
    return 6LL;
  }
  else {
    return 0LL;
  }
}

  if (*v8 >= 0) {
    return 6LL;
  }
  else {
    return 0LL;
  }
}

uint64_t os_channel_slot_detach_packet(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(_BYTE *)(*(void *)(*(void *)result + 16LL) + 16LL) & 8) == 0) {
    return 45LL;
  }
  uint64_t v4 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(result + 24);
  unint64_t v5 = (unint64_t)(a2 - v3) >> 3;
  if (*(_DWORD *)v4 <= *(_DWORD *)(v4 + 4))
  {
    unsigned int v6 = *(_DWORD *)(v4 + 4);
    goto LABEL_8;
  }

  if (*(_DWORD *)v4 <= v5)
  {
    unsigned int v6 = *(_DWORD *)(v4 + 12);
LABEL_8:
    if (v6 > v5)
    {
LABEL_9:
      __int16 v7 = *(_WORD *)(a2 + 4);
      if ((v7 & 1) != 0)
      {
        if (((*(void *)(result + 64)
             + *(_DWORD *)(v3 + ((a2 - v3) & 0x7FFFFFFF8LL)) * *(unsigned __int16 *)(v4 + 24)) & 0xFFFFFFFFFFFFFFF0LL | *(_DWORD *)(result + 32) & 3LL | (4 * (*(_DWORD *)(result + 36) & 3LL)))
           + 16 == a3)
        {
          if ((*(_WORD *)((a3 & 0xFFFFFFFFFFFFFFF0LL) + 0x18) & 1) != 0)
          {
            *(_DWORD *)a2 = -1;
            *(_WORD *)(a2 + 4) = v7 & 0xFFFE;
            uint64_t v8 = *(int **)(result + 8);
            goto LABEL_14;
          }

LABEL_22:
          uint64_t v8 = *(int **)(result + 8);
          if (*v8 < 0)
          {
            qword_18C50D128 = (uint64_t)"packet not finalized";
            __break(1u);
            goto LABEL_24;
          }

          goto LABEL_14;
        }
      }

      else
      {
        uint64_t v8 = *(int **)(result + 8);
        if ((*v8 & 0x80000000) == 0) {
          goto LABEL_14;
        }
        qword_18C50D128 = (uint64_t)"Slot has no attached packet";
        qword_18C50D158 = a2;
        __break(1u);
      }

      uint64_t v8 = *(int **)(result + 8);
      if ((*v8 & 0x80000000) == 0) {
        goto LABEL_14;
      }
      qword_18C50D128 = (uint64_t)"packet handle mismatch";
      __break(1u);
      goto LABEL_22;
    }
  }

  v31 |= 0x100u;
  if ((v26 & 0x200) == 0)
  {
LABEL_11:
    if ((v26 & 0x400) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    v31 |= 0x400u;
    if ((v26 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }

uint64_t os_channel_packet_pool_purge( unsigned int *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((*(_BYTE *)(*((void *)a1 + 2) + 16LL) & 8) == 0) {
    return 45LL;
  }
  uint64_t result = __channel_sync((void *)*a1, (void *)2, (void *)(a1[1] & 0xFFFFFFF9 | 4), a4, a5, a6, a7, a8);
  if ((_DWORD)result)
  {
    if ((*(_DWORD *)(*((void *)a1 + 3) + 4LL) & 0x80000000) == 0) {
      return result;
    }
    int v38 = result;
    qword_18C50D128 = (uint64_t)"packet pool purge sync failed";
    qword_18C50D158 = (int)result;
    __break(1u);
  }

  else
  {
    uint64_t result = os_channel_purge_packet_alloc_ring_common((uint64_t)a1, 0, v10, v11, v12, v13, v14, v15);
    if ((_DWORD)result) {
      return result;
    }
    if (*((unsigned __int8 *)a1 + 68) != 255)
    {
      uint64_t result = os_channel_purge_packet_alloc_ring_common((uint64_t)a1, 1, v16, v17, v18, v19, v20, v21);
      if ((_DWORD)result) {
        return result;
      }
    }

    if ((2 * *(_DWORD *)(*((void *)a1 + 3) + 288LL)) >= 3)
    {
      uint64_t v22 = *(unsigned int **)&a1[24 * *((unsigned __int8 *)a1 + 66) + 22];
      unsigned int v23 = *v22;
      int v24 = v22[1] - *v22;
      if (v24 < 0) {
        v24 += v22[3];
      }
      uint64_t v25 = &a1[24 * *((unsigned __int8 *)a1 + 66)];
      uint64_t v26 = v25 + 24;
      unsigned int v27 = v22[22];
      int v39 = (_DWORD **)(v25 + 20);
      uint64_t v28 = v25 + 38;
      uint64_t v29 = v25 + 32;
      uint64_t v30 = v25 + 30;
      int v31 = v24 + 1;
      while (--v31 > v27)
      {
        uint64_t v32 = *v26 + 8LL * v23;
        if ((*(_WORD *)(v32 + 4) & 1) == 0 && (**v39 & 0x80000000) != 0)
        {
          qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
          __break(1u);
          break;
        }

        uint64_t v33 = *v28 + *(_DWORD *)v32 * *((unsigned __int16 *)v22 + 13);
        *(_DWORD *)uint64_t v32 = -1;
        *(_WORD *)(*v26 + 8LL * v23 + 4) &= ~1u;
        uint64_t v34 = *(unsigned int *)(v33 + 20);
        uint64_t v35 = 5LL;
        if ((*(_WORD *)(v33 + 40) & 2) != 0)
        {
          int v36 = v29;
        }

        else
        {
          uint64_t v35 = 4LL;
          int v36 = v30;
        }

        uint64_t v37 = *v36 + v22[v35] * v34;
        *(void *)(v33 + 8) = v37;
        if (!v37)
        {
          qword_18C50D128 = (uint64_t)"buflet with NULL buffer";
          qword_18C50D158 = v34;
          __break(1u);
LABEL_30:
          if ((*(_DWORD *)(*((void *)a1 + 3) + 4LL) & 0x80000000) != 0) {
            goto LABEL_39;
          }
          return 6LL;
        }

        uint64_t v34 = *(unsigned int *)(v33 + 24);
        if ((_DWORD)v34 != -1) {
          goto LABEL_30;
        }
        if (v23 + 1 == v22[3]) {
          unsigned int v23 = 0;
        }
        else {
          ++v23;
        }
        *uint64_t v22 = v23;
        uint64_t result = os_channel_buflet_free((uint64_t)a1, v33, v16, v17, v18, v19, v20, v21);
        if ((_DWORD)result)
        {
          if ((*(_DWORD *)(*((void *)a1 + 3) + 4LL) & 0x80000000) == 0) {
            return result;
          }
          qword_18C50D128 = (uint64_t)"buflet pool purge free failed";
          qword_18C50D158 = result;
          __break(1u);
          return 45LL;
        }
      }
    }

    uint64_t result = __channel_sync((void *)*a1, (void *)2, (void *)2, v17, v18, v19, v20, v21);
    int v38 = *(_DWORD *)(*((void *)a1 + 3) + 4LL);
    if (!(_DWORD)result)
    {
      if (v38 >= 0) {
        return 6LL;
      }
      else {
        return 0LL;
      }
    }
  }

  if (v38 < 0)
  {
    uint64_t v34 = (int)result;
    qword_18C50D128 = (uint64_t)"packet pool free sync failed";
    qword_18C50D158 = (int)result;
    __break(1u);
LABEL_39:
    qword_18C50D128 = (uint64_t)"buflet with invalid nidx";
    qword_18C50D158 = v34;
    __break(1u);
  }

  return result;
}

uint64_t os_channel_purge_packet_alloc_ring_common( uint64_t result, int a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v8 = 64LL;
  if (a2) {
    uint64_t v8 = 68LL;
  }
  unsigned int v9 = *(unsigned __int8 *)(result + v8);
  uint64_t v10 = *(unsigned int **)(result + 96LL * *(unsigned __int8 *)(result + v8) + 88);
  unsigned int v11 = *v10;
  int v12 = v10[1] - *v10;
  if (v12 < 0) {
    v12 += v10[3];
  }
  uint64_t v13 = result + 96LL * v9;
  uint64_t v14 = (void *)(v13 + 96);
  uint64_t v34 = (_DWORD **)(v13 + 80);
  unsigned int v15 = v10[22];
  uint64_t v16 = (void *)(v13 + 136);
  uint64_t v17 = (int *)(v13 + 104);
  int v18 = (int *)(v13 + 108);
  uint64_t v35 = (_DWORD *)(v13 + 160);
  uint64_t v36 = result;
  int v19 = (void *)(v13 + 128);
  int v20 = (void *)(v13 + 120);
  int v21 = v12 + 1;
  do
  {
    if (--v21 <= v15) {
      return 0LL;
    }
    uint64_t v22 = *v14 + 8LL * v11;
    if ((*(_WORD *)(v22 + 4) & 1) == 0 && (**v34 & 0x80000000) != 0) {
      goto LABEL_36;
    }
    unsigned int v23 = (uint64_t *)(*v16 + *(_DWORD *)v22 * *((unsigned __int16 *)v10 + 12));
    uint64_t v26 = *v23;
    unint64_t v25 = (unint64_t)(v23 + 2);
    uint64_t v24 = v26;
    if (v26 != ((v25 - *v16) ^ __os_ch_md_redzone_cookie) && (**v34 & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
      qword_18C50D158 = v24;
      __break(1u);
      return 0LL;
    }

    int v27 = *v17;
    int v28 = *v18;
    *(_DWORD *)uint64_t v22 = -1;
    *(_WORD *)(*v14 + 8LL * v11 + 4) &= ~1u;
    if (*v17 == 2)
    {
      uint64_t v29 = *(unsigned __int16 *)(v25 + 154);
      if (*(_WORD *)(v25 + 154)) {
        BOOL v30 = *(unsigned __int16 *)(v25 + 152) == 0;
      }
      else {
        BOOL v30 = 1;
      }
      if (v30) {
        goto LABEL_32;
      }
      if (!*v35)
      {
        uint64_t v29 = 1LL;
        qword_18C50D128 = (uint64_t)"Invalid max bufcnt";
        qword_18C50D158 = 1LL;
        __break(1u);
LABEL_35:
        qword_18C50D128 = (uint64_t)"Invalid bufcnt";
        qword_18C50D158 = v29;
        __break(1u);
LABEL_36:
        qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
        __break(1u);
        goto LABEL_37;
      }
    }

    unint64_t v31 = v25 & 0xFFFFFFFFFFFFFFF0LL | v27 & 3 | (4LL * (v28 & 3));
    uint64_t v32 = 5LL;
    if ((*(_WORD *)(v25 + 72) & 2) != 0)
    {
      uint64_t v33 = v19;
    }

    else
    {
      uint64_t v32 = 4LL;
      uint64_t v33 = v20;
    }

    *(void *)(v25 + 40) = *v33 + v10[v32] * *(_DWORD *)(v25 + 52);
    if (v11 + 1 == v10[3]) {
      unsigned int v11 = 0;
    }
    else {
      ++v11;
    }
    *uint64_t v10 = v11;
    uint64_t result = os_channel_packet_free(v36, v31, a3, a4, a5, a6, a7, a8);
  }

  while (!(_DWORD)result);
  if ((*(_DWORD *)(*(void *)(v36 + 24) + 4LL) & 0x80000000) == 0) {
    return result;
  }
  qword_18C50D128 = (uint64_t)"packet pool purge free failed";
  qword_18C50D158 = result;
  __break(1u);
LABEL_32:
  if ((**v34 & 0x80000000) == 0) {
    return 6LL;
  }
LABEL_37:
  qword_18C50D128 = (uint64_t)"pkt pool purge, bad bufcnt";
  __break(1u);
  return result;
}

uint64_t os_channel_buflet_free( uint64_t result, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((*(_BYTE *)(*(void *)(result + 16) + 16LL) & 8) == 0) {
    return 45LL;
  }
  uint64_t v8 = result;
  if ((*(_DWORD *)(*(void *)(result + 24) + 288LL) & 0x7FFFFFFE) == 0) {
    return 45LL;
  }
  unsigned int v10 = *(unsigned __int8 *)(result + 67);
  uint64_t v11 = result + 96LL * *(unsigned __int8 *)(result + 67);
  uint64_t v14 = *(unsigned int **)(v11 + 88);
  uint64_t v13 = v11 + 88;
  int v12 = v14;
  uint64_t v15 = *v14;
  if ((_DWORD)v15 == v14[1]
    && (uint64_t result = __channel_sync((void *)*(unsigned int *)result, (void *)2, (void *)2, a4, a5, a6, a7, a8),
        (_DWORD)result)
    && (*(_DWORD *)(*(void *)(v8 + 24) + 4LL) & 0x80000000) != 0)
  {
    qword_18C50D128 = (uint64_t)"buflet pool free sync failed";
    qword_18C50D158 = (int)result;
    __break(1u);
  }

  else if ((_DWORD)v15 != v12[1])
  {
    goto LABEL_5;
  }

  uint64_t v16 = *(unsigned int *)(*(void *)(v8 + 24) + 4LL);
  if ((v16 & 0x80000000) == 0)
  {
LABEL_5:
    uint64_t v16 = *(unsigned int *)(a2 + 16);
    goto LABEL_18;
  }

  qword_18C50D128 = (uint64_t)"no ring space in buflet free ring";
  __break(1u);
LABEL_18:
  if ((**(_DWORD **)(v8 + 96LL * v10 + 80) & 0x80000000) != 0)
  {
    qword_18C50D128 = (uint64_t)"bad buflet handle";
    qword_18C50D158 = v16;
    __break(1u);
    return result;
  }

LABEL_6:
  uint64_t v17 = v8 + 96LL * v10;
  *(_DWORD *)(*(void *)(v17 + 96) + 8 * v15) = v16;
  *(_WORD *)(*(void *)(v17 + 96) + 8 * v15 + 4) |= 1u;
  if ((_DWORD)v15 + 1 == v12[3]) {
    int v18 = 0;
  }
  else {
    int v18 = v15 + 1;
  }
  *int v12 = v18;
  else {
    return 0LL;
  }
}

uint64_t os_channel_get_next_event_handle(uint64_t a1, unint64_t *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v4 = 22LL;
  if (!a2 || !a3 || !a4) {
    return v4;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if ((*(_BYTE *)(v5 + 16) & 0x40) == 0) {
    return 45LL;
  }
  uint64_t v6 = *(void *)(a1 + 24);
  *a2 = 0LL;
  unsigned int v7 = *(_DWORD *)(v5 + 308)
     - (*(_DWORD *)(v5 + 304)
      + *(_DWORD *)(v5 + 312))
     + *(_DWORD *)(v5 + 316)
     + 2 * *(_DWORD *)(v6 + 288)
     + 2;
  uint64_t v8 = 96LL;
  uint64_t v9 = a1 + 96LL * v7;
  int v12 = *(unsigned int **)(v9 + 88);
  uint64_t v10 = v9 + 88;
  uint64_t v11 = v12;
  uint64_t v13 = *v12;
  if ((_DWORD)v13 == v12[1])
  {
    else {
      return 6LL;
    }
  }

  uint64_t v14 = a1 + 96LL * v7;
  uint64_t v16 = *(void *)(v14 + 96);
  uint64_t v15 = (void *)(v14 + 96);
  uint64_t v17 = v16 + 8 * v13;
  if ((*(_WORD *)(v17 + 4) & 1) == 0)
  {
    uint64_t v20 = **(unsigned int **)(a1 + 96LL * v7 + 80);
    if ((v20 & 0x80000000) != 0)
    {
      qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
      __break(1u);
LABEL_51:
      if ((**(_DWORD **)(a1 + 96LL * v7 + 80) & 0x80000000) != 0)
      {
        qword_18C50D128 = (uint64_t)"Metadata redzone corrupted";
        qword_18C50D158 = v20;
        __break(1u);
        goto LABEL_53;
      }

      goto LABEL_8;
    }
  }

  uint64_t v18 = *(void *)(a1 + 96LL * v7 + 136);
  int v19 = (uint64_t *)(v18 + *(_DWORD *)v17 * *((unsigned __int16 *)v11 + 12));
  uint64_t v21 = *v19;
  uint64_t v8 = (uint64_t)(v19 + 2);
  uint64_t v20 = v21;
  if (v21 != ((v8 - v18) ^ __os_ch_md_redzone_cookie)) {
    goto LABEL_51;
  }
LABEL_8:
  *(_DWORD *)uint64_t v17 = -1;
  *(_WORD *)(*v15 + 8 * v13 + 4) &= ~1u;
  uint64_t v17 = *(void *)v10;
  uint64_t v22 = a1 + 96LL * v7;
  int v23 = *(_DWORD *)(v22 + 104);
  uint64_t v15 = (void *)(v22 + 104);
  if (v23 == 2)
  {
    uint64_t v24 = *(unsigned __int16 *)(v8 + 154);
    uint64_t v10 = *(unsigned __int16 *)(v8 + 152);
    if (*(_WORD *)(v8 + 154)) {
      BOOL v25 = (_DWORD)v10 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25)
    {
      if (*(_DWORD *)(a1 + 96LL * v7 + 160) >= v10)
      {
        if (v24 <= v10)
        {
          if (*(_DWORD *)(v8 + 52) != -1)
          {
            uint64_t v26 = v8 + 32;
            goto LABEL_17;
          }

LABEL_56:
        qword_18C50D128 = (uint64_t)"Invalid bufcnt";
        qword_18C50D158 = v24;
        __break(1u);
        goto LABEL_57;
      }

LABEL_55:
      uint64_t v24 = v10;
      qword_18C50D128 = (uint64_t)"Invalid max bufcnt";
      qword_18C50D158 = v10;
      __break(1u);
      goto LABEL_56;
    }

LABEL_53:
    if ((**(_DWORD **)(a1 + 96LL * v7 + 80) & 0x80000000) == 0) {
      return 6LL;
    }
    qword_18C50D128 = (uint64_t)"bad bufcnt";
    __break(1u);
    goto LABEL_55;
  }

  uint64_t v26 = v8 + 32;
  uint64_t v41 = a1 + 96LL * v7;
  uint64_t v42 = (void *)(v41 + 120);
  __int128 v43 = (void *)(v41 + 128);
  uint64_t v44 = 20LL;
  if ((*(_WORD *)(v8 + 72) & 2) == 0)
  {
    uint64_t v44 = 16LL;
    __int128 v43 = v42;
  }

  *(void *)(v8 + 40) = *v43 + (*(_DWORD *)(v17 + v44) * *(_DWORD *)(v8 + 52));
LABEL_35:
  uint64_t v45 = *(void *)(v26 + 8);
  uint64_t v4 = 6LL;
  if (v45)
  {
    uint64_t v46 = *(unsigned __int16 *)(v26 + 32);
    *a2 = v8 & 0xFFFFFFFFFFFFFFF0LL | *(_DWORD *)v15 & 3 | (4LL * (*(_DWORD *)(a1 + 96LL * v7 + 108) & 3));
    uint64_t v47 = (_DWORD *)(v45 + v46);
    *a3 = *v47;
    *a4 = v47[1];
    if ((_DWORD)v13 + 1 == v11[3]) {
      unsigned int v48 = 0;
    }
    else {
      unsigned int v48 = v13 + 1;
    }
    *uint64_t v11 = v48;
    else {
      return 0LL;
    }
  }

  return v4;
}

uint64_t os_channel_get_interface_advisory( uint64_t a1, uint32x4_t *a2, int8x16_t a3, int8x16_t a4, __n128 a5, uint64x2_t a6)
{
  uint64_t v6 = *(void *)(a1 + 48);
  if (!v6) {
    return 2LL;
  }
  int v8 = *(_DWORD *)(v6 + 4);
  if ((v8 - 3) < 0xFFFFFFFE)
  {
    unsigned int v14 = 2;
LABEL_7:
    else {
      return 6LL;
    }
  }

  BOOL v9 = v8 == 2;
  uint64_t v10 = 32LL;
  if (v9) {
    uint64_t v10 = 16LL;
  }
  int v11 = *(_DWORD *)(v6 + v10);
  int v12 = os_cpu_copy_in_cksum((uint32x4_t *)(v6 + v10 + 8), a2, 96LL, 0LL, a3, a4, a5, a6);
  uint64_t result = 0LL;
  if (v11 != v12)
  {
    unsigned int v14 = 35;
    goto LABEL_7;
  }

  return result;
}

uint64_t os_channel_configure_interface_advisory( unsigned int *a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  int v9 = a2;
  return __channel_set_opt((void *)*a1, (void *)3, &v9, (void *)4, a5, a6, a7, a8);
}

uint64_t os_channel_buflet_alloc( uint64_t result, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((*(_BYTE *)(*(void *)(result + 16) + 16LL) & 8) == 0) {
    return 45LL;
  }
  uint64_t v8 = result;
  if ((*(_DWORD *)(*(void *)(result + 24) + 288LL) & 0x7FFFFFFE) == 0) {
    return 45LL;
  }
  unsigned int v10 = *(unsigned __int8 *)(result + 66);
  int v11 = *(unsigned int **)(result + 96LL * *(unsigned __int8 *)(result + 66) + 88);
  uint64_t v12 = *v11;
  if ((_DWORD)v12 == v11[1])
  {
    uint64_t result = __channel_sync((void *)*(unsigned int *)result, (void *)2, (void *)0xA, a4, a5, a6, a7, a8);
    if ((_DWORD)result)
    {
      if ((*(_DWORD *)(*(void *)(v8 + 24) + 4LL) & 0x80000000) == 0) {
        return result;
      }
      qword_18C50D128 = (uint64_t)"buflet pool alloc sync failed";
      qword_18C50D158 = (int)result;
      __break(1u);
      goto LABEL_21;
    }
  }

  if ((_DWORD)v12 == v11[1])
  {
LABEL_21:
    else {
      return 6LL;
    }
  }

  uint64_t v13 = v8 + 96LL * v10;
  uint64_t v15 = *(void *)(v13 + 96);
  uint64_t v14 = v13 + 96;
  uint64_t v16 = v15 + 8 * v12;
  if ((*(_WORD *)(v16 + 4) & 1) == 0 && (**(_DWORD **)(v8 + 96LL * v10 + 80) & 0x80000000) != 0)
  {
    qword_18C50D128 = (uint64_t)"Slot descriptor has no metadata";
    __break(1u);
LABEL_26:
    qword_18C50D128 = (uint64_t)"buflet alloc with NULL buffer";
    qword_18C50D158 = v14;
    __break(1u);
LABEL_27:
    if ((*(_DWORD *)(*(void *)(v8 + 24) + 4LL) & 0x80000000) == 0) {
      return 6LL;
    }
    qword_18C50D128 = (uint64_t)"buflet alloc with invalid nidx";
    qword_18C50D158 = v14;
    __break(1u);
    return result;
  }

  uint64_t v17 = (void *)(v8 + 96LL * v10);
  uint64_t v18 = v17[19] + *(_DWORD *)v16 * *((unsigned __int16 *)v11 + 13);
  *(_DWORD *)uint64_t v16 = -1;
  *(_WORD *)(*(void *)v14 + 8 * v12 + 4) &= ~1u;
  uint64_t v14 = *(unsigned int *)(v18 + 20);
  int v19 = v17 + 15;
  uint64_t v20 = v17 + 16;
  uint64_t v21 = 5LL;
  if ((*(_WORD *)(v18 + 40) & 2) == 0)
  {
    uint64_t v21 = 4LL;
    uint64_t v20 = v19;
  }

  uint64_t v22 = *v20 + v11[v21] * v14;
  *(void *)(v18 + 8) = v22;
  if (!v22) {
    goto LABEL_26;
  }
  uint64_t v14 = *(unsigned int *)(v18 + 24);
  if ((_DWORD)v14 != -1) {
    goto LABEL_27;
  }
  if ((_DWORD)v12 + 1 == v11[3]) {
    unsigned int v23 = 0;
  }
  else {
    unsigned int v23 = v12 + 1;
  }
  *int v11 = v23;
  *a2 = v18;
  else {
    return 0LL;
  }
}

int sem_destroy(sem_t *a1)
{
  uint64_t v1 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v1) {
    uint64_t v1 = &errno;
  }
  *uint64_t v1 = 78;
  return -1;
}

int sem_getvalue(sem_t *a1, int *a2)
{
  uint64_t v2 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v2) {
    uint64_t v2 = &errno;
  }
  int *v2 = 78;
  return -1;
}

int sem_init(sem_t *a1, int a2, unsigned int a3)
{
  uint64_t v3 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v3) {
    uint64_t v3 = &errno;
  }
  int *v3 = 78;
  return -1;
}

int kill(pid_t a1, int a2)
{
  return __kill(a1, a2);
}

uint64_t coalition_create(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return __coalition((void *)1, a1, a2, a4, a5, a6, a7, a8);
}

uint64_t coalition_terminate( uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = a1;
  return __coalition((void *)2, &v9, a2, a4, a5, a6, a7, a8);
}

uint64_t coalition_reap(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = a1;
  return __coalition((void *)3, &v9, a2, a4, a5, a6, a7, a8);
}

uint64_t coalition_info_resource_usage( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = a3;
  uint64_t v10 = a1;
  return __coalition_info((void *)1, &v10, a2, &v9, a5, a6, a7, a8);
}

uint64_t coalition_info_debug_info( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = a3;
  uint64_t v10 = a1;
  return __coalition_info((void *)4, &v10, a2, &v9, a5, a6, a7, a8);
}

uint64_t coalition_info_set_name( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9 = a3;
  uint64_t v10 = a1;
  return __coalition_info((void *)2, &v10, a2, &v9, a5, a6, a7, a8);
}

uint64_t coalition_info_set_efficiency( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v11 = a1;
  uint64_t v9 = 8LL;
  uint64_t v10 = a2;
  return __coalition_info((void *)3, &v11, &v10, &v9, a5, a6, a7, a8);
}

uint64_t coalition_ledger_set_logical_writes_limit( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v11 = a1;
  uint64_t v9 = 8LL;
  uint64_t v10 = a2;
  return __coalition_ledger((void *)1, &v11, &v10, &v9, a5, a6, a7, a8);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  __int16 v7 = a4;
  if ((a4 & 2) != 0)
  {
    if (a2) {
      goto LABEL_4;
    }
LABEL_10:
    cerror_nocancel(22);
    return (void *)-1LL;
  }

  if (!a2 || (a4 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  uint64_t v9 = __mmap(a1, a2, a3, a4 | 0x40000u, a5, a6);
  if (__syscall_logger)
  {
    if ((v7 & 0x1000) != 0) {
      uint64_t v10 = a5 & 0xFF000000 | 0x10;
    }
    else {
      uint64_t v10 = 144LL;
    }
    __syscall_logger(v10, mach_task_self_, a2, 0LL, v9, 0LL);
  }

  return v9;
}

uint64_t csr_check(int a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  int v9 = a1;
  return __csrctl(0LL, &v9, (void *)4, a4, a5, a6, a7, a8);
}

uint64_t csr_get_active_config( void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return __csrctl((void *)1, a1, (void *)4, a4, a5, a6, a7, a8);
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return __fs_snapshot((void *)1, *(void **)&a1, (void *)a2, 0LL, 0LL, *(void **)&a3, v3, v4);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  if (!a5) {
    return getattrlistbulk(a1, a2, a3, a4, 0x40uLL);
  }
  uint64_t v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v5) {
    uint64_t v5 = &errno;
  }
  int *v5 = 22;
  return -1;
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return __fs_snapshot((void *)2, *(void **)&a1, (void *)a2, 0LL, 0LL, *(void **)&a3, v3, v4);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return __fs_snapshot((void *)3, *(void **)&a1, (void *)a2, (void *)a3, 0LL, *(void **)&a4, v4, v5);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return __fs_snapshot((void *)5, *(void **)&a1, (void *)a2, 0LL, 0LL, *(void **)&a3, v3, v4);
}

uint64_t fs_snapshot_root( void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  return __fs_snapshot((void *)6, a1, a2, 0LL, 0LL, a3, a7, a8);
}

int fs_snapshot_mount(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return __fs_snapshot((void *)4, *(void **)&a1, (void *)a3, (void *)a2, 0LL, *(void **)&a4, v4, v5);
}

uint64_t debug_syscall_reject_config( char *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if ((supported & 1) != 0) {
    return 0LL;
  }
  if (a2 > 0x12)
  {
    int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v9) {
      int v9 = &errno;
    }
    *int v9 = 7;
    return 0xFFFFFFFFLL;
  }

  if (a2)
  {
    unint64_t v10 = 0LL;
    unint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    char v13 = 64;
    while (1)
    {
      char v14 = *a1++;
      unint64_t v15 = v14 & 0x7F;
      if (v10 > 0x3F) {
        break;
      }
      v11 |= v15 << v10;
      if (v10 >= 0x3A)
      {
        unint64_t v16 = v15 >> v13;
LABEL_14:
        v12 |= v16;
      }

      v10 += 7LL;
      v13 -= 7;
      if (!--a2) {
        goto LABEL_18;
      }
    }

    unint64_t v16 = v15 << v10;
    goto LABEL_14;
  }

  unint64_t v12 = 0LL;
  unint64_t v11 = 0LL;
LABEL_18:
  uint64_t result = __debug_syscall_reject_config((void *)v11, (void *)v12, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result == -1)
  {
    uint64_t v17 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v17) {
      uint64_t v17 = &errno;
    }
    if (*v17 != 45) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = 0LL;
    *uint64_t v17 = 0;
    supported = 1;
  }

  return result;
}

uint64_t debug_syscall_reject( char *a1, unint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return debug_syscall_reject_config(a1, a2, 0LL, a4, a5, a6, a7, a8);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  kern_return_t result;
  uint32_t numer = mach_timebase_info_cached_info.numer;
  uint32_t denom = mach_timebase_info_cached_info.denom;
  if (mach_timebase_info_cached_info.numer) {
    BOOL v4 = mach_timebase_info_cached_info.denom == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t result = mach_timebase_info_trap(&mach_timebase_info_cached_info);
    if (result) {
      return result;
    }
    uint32_t numer = mach_timebase_info_cached_info.numer;
    uint32_t denom = mach_timebase_info_cached_info.denom;
  }

  uint64_t result = 0;
  info->uint32_t numer = numer;
  info->uint32_t denom = denom;
  return result;
}

uint64_t kdebug_typefilter( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = kdebug_typefilter_typefilter;
  if (!kdebug_typefilter_typefilter)
  {
    uint64_t v11 = 0LL;
    mach_vm_address_t address = 0LL;
    if (!__kdebug_typefilter(&address, &v11, a3, a4, a5, a6, a7, a8))
    {
      mach_vm_address_t v9 = address;
      if (address)
      {
        while (!__ldaxr((unint64_t *)&kdebug_typefilter_typefilter))
        {
        }

        __clrex();
        mach_vm_deallocate(mach_task_self_, address, 0x2000uLL);
      }
    }

    return kdebug_typefilter_typefilter;
  }

  return result;
}

BOOL kdebug_is_enabled(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  BOOL result = 0;
  if (MEMORY[0xFFFFFC100])
  {
    if ((MEMORY[0xFFFFFC100] & 2) == 0) {
      return 1;
    }
    unsigned int v8 = a1;
    uint64_t v9 = kdebug_typefilter(a1, a2, a3, a4, a5, a6, a7, a8);
  }

  return result;
}

uint64_t kdebug_using_continuous_time()
{
  return (MEMORY[0xFFFFFC100] >> 2) & 1;
}

uint64_t kdebug_timestamp()
{
  if ((MEMORY[0xFFFFFC100] & 4) != 0) {
    return mach_continuous_time();
  }
  else {
    return mach_absolute_time();
  }
}

uint64_t kdebug_timestamp_from_absolute(uint64_t result)
{
  if ((MEMORY[0xFFFFFC100] & 4) != 0) {
    result += MEMORY[0xFFFFFC098];
  }
  return result;
}

uint64_t kdebug_timestamp_from_continuous(uint64_t result)
{
  if ((MEMORY[0xFFFFFC100] & 4) == 0) {
    result -= MEMORY[0xFFFFFC098];
  }
  return result;
}

uint64_t kdebug_trace(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = kdebug_is_enabled((uint64_t)a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)result) {
    return __kdebug_trace64(a1, a2, a3, a4, a5, v14, v15, v16);
  }
  return result;
}

uint64_t kdebug_trace_string(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v17 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v17) {
    uint64_t v17 = &errno;
  }
  *uint64_t v17 = 22;
  return -1LL;
}

int kdebug_signpost(uint32_t code, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
  return kdebug_signpost_internal(4 * code, (void *)arg1, (void *)arg2, (void *)arg3, (void *)arg4, v5, v6, v7);
}

uint64_t kdebug_signpost_internal( unsigned int a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1 >= 0x10000)
  {
    uint64_t v17 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v17) {
      uint64_t v17 = &errno;
    }
    *uint64_t v17 = 22;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v12 = a1 | 0x210A0000;
    uint64_t result = kdebug_is_enabled(v12, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
    if ((_DWORD)result) {
      return __kdebug_trace64((void *)v12, a2, a3, a4, a5, v14, v15, v16);
    }
  }

  return result;
}

int kdebug_signpost_start(uint32_t code, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
  return kdebug_signpost_internal((4 * code) | 1, (void *)arg1, (void *)arg2, (void *)arg3, (void *)arg4, v5, v6, v7);
}

int kdebug_signpost_end(uint32_t code, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4)
{
  return kdebug_signpost_internal((4 * code) | 2, (void *)arg1, (void *)arg2, (void *)arg3, (void *)arg4, v5, v6, v7);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  if (a1 < 1025) {
    return select_DARWIN_EXTSN(a1, a2, a3, a4, a5);
  }
  uint64_t v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v5) {
    uint64_t v5 = &errno;
  }
  int *v5 = 22;
  return -1;
}

int pselect(int a1, fd_set *a2, fd_set *a3, fd_set *a4, const timespec *a5, const sigset_t *a6)
{
  if (a1 >= 1025)
  {
    uint64_t v6 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v6) {
      uint64_t v6 = &errno;
    }
    int *v6 = 22;
    return -1;
  }

  p___darwin_time_t tv_sec = (timespec *)a5;
  int v7 = __pselect(a1, a2, a3, a4, a5, a6);
  if (v7 != -1) {
    return v7;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  unint64_t v16 = *(int **)(StatusReg + 8);
  if (!v16) {
    unint64_t v16 = &errno;
  }
  if (*v16 != 78) {
    return -1;
  }
  if (p_tv_sec)
  {
    uint64_t tv_nsec = p_tv_sec->tv_nsec;
    __darwin_time_t tv_sec = p_tv_sec->tv_sec;
    int v22 = (int)tv_nsec / 1000;
    p___darwin_time_t tv_sec = (timespec *)&tv_sec;
  }

  if (!a6) {
    return select_DARWIN_EXTSN(a1, a2, a3, a4, (timeval *)p_tv_sec);
  }
  int v7 = __pthread_sigmask(3, a6, &v23);
  if (!v7)
  {
    int v7 = select_DARWIN_EXTSN(a1, a2, a3, a4, (timeval *)p_tv_sec);
    uint64_t v18 = *(int **)(StatusReg + 8);
    if (!v18) {
      uint64_t v18 = &errno;
    }
    int v19 = *v18;
    __pthread_sigmask(3, &v23, 0LL);
    uint64_t v20 = *(int **)(StatusReg + 8);
    if (!v20) {
      uint64_t v20 = &errno;
    }
    *uint64_t v20 = v19;
  }

  return v7;
}

uint64_t select_NOCANCEL(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unsigned int v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v8) {
    unsigned int v8 = &errno;
  }
  *unsigned int v8 = 22;
  return 0xFFFFFFFFLL;
}

uint64_t pselect_NOCANCEL(void *a1, void *a2, void *a3, void *a4, uint64_t *a5, void *a6, void *a7, void *a8)
{
  if ((int)a1 >= 1025)
  {
    unsigned int v8 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v8) {
      unsigned int v8 = &errno;
    }
    *unsigned int v8 = 22;
    return 0xFFFFFFFFLL;
  }

  uint64_t v11 = a5;
  uint64_t v9 = __pselect_nocancel(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v9 != -1) {
    return v9;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v21 = *(int **)(StatusReg + 8);
  if (!v21) {
    uint64_t v21 = &errno;
  }
  if (*v21 != 78) {
    return 0xFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t v22 = v11[1];
    uint64_t v29 = *v11;
    int v30 = (int)v22 / 1000;
    uint64_t v11 = &v29;
  }

  if (!a6) {
    return select_DARWIN_EXTSN_NOCANCEL(a1, a2, a3, a4, v11, v16, v17, v18);
  }
  uint64_t v9 = __pthread_sigmask(3, (const sigset_t *)a6, &v31);
  if (!(_DWORD)v9)
  {
    uint64_t v9 = select_DARWIN_EXTSN_NOCANCEL(a1, a2, a3, a4, v11, v23, v24, v25);
    uint64_t v26 = *(int **)(StatusReg + 8);
    if (!v26) {
      uint64_t v26 = &errno;
    }
    int v27 = *v26;
    __pthread_sigmask(3, &v31, 0LL);
    int v28 = *(int **)(StatusReg + 8);
    if (!v28) {
      int v28 = &errno;
    }
    *int v28 = v27;
  }

  return v9;
}

int setrlimit(int a1, const rlimit *a2)
{
  return __setrlimit(a1 | 0x1000, a2);
}

uint64_t sigsuspend_NOCANCEL( unsigned int *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1) {
    a1 = (unsigned int *)*a1;
  }
  return __sigsuspend_nocancel(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_nexus_attr_create()
{
  uint64_t v0 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = v0(176LL);
  uint64_t v2 = v1;
  if (v1) {
    (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v1, 176LL);
  }
  return v2;
}

_OWORD *os_nexus_attr_clone(__int128 *a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t v3 = v1(176LL);
  BOOL v4 = (_OWORD *)v3;
  if (v3)
  {
    (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v3, 176LL);
    if (a1)
    {
      __int128 v5 = *a1;
      __int128 v6 = a1[2];
      v4[1] = a1[1];
      v4[2] = v6;
      _OWORD *v4 = v5;
      __int128 v7 = a1[3];
      __int128 v8 = a1[4];
      __int128 v9 = a1[6];
      v4[5] = a1[5];
      v4[6] = v9;
      v4[3] = v7;
      v4[4] = v8;
      __int128 v10 = a1[7];
      __int128 v11 = a1[8];
      __int128 v12 = a1[10];
      v4[9] = a1[9];
      v4[10] = v12;
      v4[7] = v10;
      v4[8] = v11;
    }
  }

  return v4;
}

uint64_t os_nexus_attr_set(void *a1, int a2, uint64_t a3)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 45LL;
  switch(a2)
  {
    case 0:
      uint64_t result = 0LL;
      *a1 |= 1uLL;
      a1[1] = a3;
      break;
    case 1:
      uint64_t result = 0LL;
      *a1 |= 2uLL;
      a1[2] = a3;
      break;
    case 2:
      uint64_t result = 0LL;
      *a1 |= 4uLL;
      a1[3] = a3;
      break;
    case 3:
      uint64_t result = 0LL;
      *a1 |= 8uLL;
      a1[4] = a3;
      break;
    case 4:
      uint64_t result = 0LL;
      *a1 |= 0x10uLL;
      a1[5] = a3;
      break;
    case 5:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 16:
      return result;
    case 6:
      uint64_t result = 0LL;
      *a1 |= 0x80uLL;
      a1[8] = a3;
      break;
    case 7:
      uint64_t result = 0LL;
      *a1 |= 0x400uLL;
      a1[11] = a3;
      break;
    case 8:
      uint64_t result = 0LL;
      *a1 |= 0x100uLL;
      a1[9] = a3;
      break;
    case 9:
      uint64_t result = 0LL;
      *a1 |= 0x200uLL;
      a1[10] = a3;
      break;
    case 13:
      uint64_t result = 0LL;
      *a1 |= 0x1000uLL;
      a1[14] = a3;
      break;
    case 17:
      uint64_t result = 0LL;
      *a1 |= 0x40000uLL;
      a1[18] = a3;
      break;
    case 18:
      uint64_t result = 0LL;
      *a1 |= 0x80000uLL;
      a1[19] = a3;
      break;
    case 19:
      uint64_t result = 0LL;
      *a1 |= 0x100000uLL;
      a1[20] = a3 != 0;
      break;
    case 20:
      uint64_t result = 0LL;
      *a1 |= 0x200000uLL;
      a1[21] = a3;
      break;
    default:
      return 22LL;
  }

  return result;
}

uint64_t os_nexus_attr_get(void *a1, unsigned int a2, void *a3)
{
  uint64_t v3 = 22LL;
  if (a1 && a3)
  {
    uint64_t v3 = a2;
    switch(a2)
    {
      case 0u:
        BOOL v4 = a1 + 1;
        goto LABEL_25;
      case 1u:
        BOOL v4 = a1 + 2;
        goto LABEL_25;
      case 2u:
        BOOL v4 = a1 + 3;
        goto LABEL_25;
      case 3u:
        BOOL v4 = a1 + 4;
        goto LABEL_25;
      case 4u:
        BOOL v4 = a1 + 5;
        goto LABEL_25;
      case 5u:
        BOOL v4 = a1 + 6;
        goto LABEL_25;
      case 6u:
        BOOL v4 = a1 + 8;
        goto LABEL_25;
      case 7u:
        BOOL v4 = a1 + 11;
        goto LABEL_25;
      case 8u:
        BOOL v4 = a1 + 9;
        goto LABEL_25;
      case 9u:
        BOOL v4 = a1 + 10;
        goto LABEL_25;
      case 0xAu:
        BOOL v4 = a1 + 12;
        goto LABEL_25;
      case 0xBu:
        BOOL v4 = a1 + 7;
        goto LABEL_25;
      case 0xCu:
        BOOL v4 = a1 + 13;
        goto LABEL_25;
      case 0xDu:
        BOOL v4 = a1 + 14;
        goto LABEL_25;
      case 0xEu:
        BOOL v4 = a1 + 15;
        goto LABEL_25;
      case 0xFu:
        BOOL v4 = a1 + 16;
        goto LABEL_25;
      case 0x10u:
        BOOL v4 = a1 + 17;
        goto LABEL_25;
      case 0x11u:
        BOOL v4 = a1 + 18;
        goto LABEL_25;
      case 0x12u:
        BOOL v4 = a1 + 19;
        goto LABEL_25;
      case 0x13u:
        BOOL v4 = a1 + 20;
        goto LABEL_25;
      case 0x14u:
        BOOL v4 = a1 + 21;
LABEL_25:
        uint64_t v3 = 0LL;
        *a3 = *v4;
        break;
      default:
        return v3;
    }
  }

  return v3;
}

uint64_t os_nexus_attr_destroy()
{
  uint64_t v0 = *(uint64_t (**)(void))(_libkernel_functions + 24);
  if (v0) {
    return v0();
  }
  return result;
}

uint64_t os_nexus_controller_create()
{
  int v18 = 1;
  uint64_t v6 = __nexus_open(&v18, (void *)0x10, v0, v1, v2, v3, v4, v5);
  if ((_DWORD)v6 == -1) {
    return 0LL;
  }
  char v13 = (void *)v6;
  char v14 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v14 || (uint64_t v15 = v14(16LL)) == 0)
  {
    guarded_close_np(v13, &v19, v7, v8, v9, v10, v11, v12);
    return 0LL;
  }

  uint64_t v16 = v15;
  (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(v15, 16LL);
  *(_DWORD *)uint64_t v16 = (_DWORD)v13;
  *(void *)(v16 + 8) = v19;
  return v16;
}

uint64_t os_nexus_controller_get_fd(unsigned int *a1)
{
  return *a1;
}

uint64_t os_nexus_controller_register_provider( unsigned int *a1, uint64_t a2, int a3, uint64_t *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18)
{
  int v30 = 1;
  if (!(*((unsigned int (**)(uint64_t *, uint64_t, uint64_t))_libkernel_string_functions + 11))( &vars0,  a2,  64LL)) {
    return 22LL;
  }
  if (!a4) {
    return __nexus_register((void *)*a1, &v30, (void *)0x100, a5, (void *)0x10, v23, v24, v25);
  }
  uint64_t v26 = *a4;
  if ((*a4 & 1) != 0)
  {
    uint64_t v28 = a4[1];
    v31 |= 1u;
    a18 = v28;
    if ((v26 & 2) == 0)
    {
LABEL_5:
      if ((v26 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }

  else if ((v26 & 2) == 0)
  {
    goto LABEL_5;
  }

  v31 |= 2u;
  if ((v26 & 4) == 0)
  {
LABEL_6:
    if ((v26 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }

LABEL_18:
  v31 |= 4u;
  if ((v26 & 8) == 0)
  {
LABEL_7:
    if ((v26 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }

LABEL_19:
  v31 |= 8u;
  if ((v26 & 0x10) == 0)
  {
LABEL_8:
    if ((v26 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }

LABEL_23:
  v31 |= 0x200u;
  if ((v26 & 0x400) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((v26 & 0x1000) == 0)
  {
LABEL_13:
    if ((v26 & 0x20000) == 0) {
      goto LABEL_30;
    }
    if (a3 != 2) {
      return 22LL;
    }
    int v27 = v31;
    goto LABEL_29;
  }

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v16);
  }

  return v8;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v14);
  }

  return v9;
}

    mach_msg_destroy(&v14);
  }

  return v9;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v19);
  }

  return v7;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v14);
  }

  return v10;
}

    mach_msg_destroy(&v14);
  }

  return v9;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v20);
  }

  return v14;
}

    mach_msg_destroy(&v11);
  }

  return v7;
}

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v6;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v10);
  }

  return v6;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v14);
  }

  return v10;
}

    mach_msg_destroy(&v14);
  }

  return v9;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v12);
  }

  return v8;
}

    mach_msg_destroy(&v15);
  }

  return v10;
}

LABEL_25:
  if (a3 != 2 || a4[14] == 2 && a18 != 4) {
    return 22LL;
  }
  int v27 = v31 | 0x1000;
  v31 |= 0x1000u;
  if ((v26 & 0x20000) != 0) {
LABEL_29:
  }
    int v31 = v27 | 0x20000;
LABEL_30:
  if ((v26 & 0x40000) != 0) {
    v31 |= 0x40000u;
  }
  if ((v26 & 0x80000) == 0) {
    goto LABEL_35;
  }
  v31 |= 0x80000u;
LABEL_35:
  if ((v26 & 0x100000) != 0)
  {
    if (a3) {
      return 22LL;
    }
    v31 |= 0x100000u;
  }

  if ((v26 & 0x200000) != 0) {
    v31 |= 0x200000u;
  }
  return __nexus_register((void *)*a1, &v30, (void *)0x100, a5, (void *)0x10, v23, v24, v25);
}

    mach_msg_destroy(&v16);
  }

  return v10;
}

    mach_msg_destroy(&v33);
  }

  return v15;
}

    mach_msg_destroy(&v33);
  }

  return v15;
}

    mach_msg_destroy(&v14);
  }

  return v7;
}

uint64_t os_nexus_controller_deregister_provider( unsigned int *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return __nexus_deregister((void *)*a1, a2, (void *)0x10, a4, a5, a6, a7, a8);
}

uint64_t os_nexus_controller_alloc_provider_instance( unsigned int *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  return __nexus_create((void *)*a1, a2, (void *)0x10, a3, (void *)0x10, a6, a7, a8);
}

uint64_t os_nexus_controller_free_provider_instance( unsigned int *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return __nexus_destroy((void *)*a1, a2, (void *)0x10, a4, a5, a6, a7, a8);
}

uint64_t os_nexus_controller_bind_provider_instance( unsigned int *a1, __int128 *a2, __int16 a3, int a4, __int128 *a5, uint64_t a6, int a7, char a8)
{
  v28[0] = 0LL;
  v28[1] = 0LL;
  (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&v21, 56LL);
  if (a2) {
    __int128 v21 = *a2;
  }
  if (a5
    && (*((unsigned int (**)(__int128 *, void *, uint64_t))_libkernel_string_functions + 3))(a5, v28, 16LL))
  {
    __int128 v24 = *a5;
  }

  __int16 v22 = a3;
  int v27 = a4;
  if ((a8 & 1) == 0)
  {
    if ((a8 & 2) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    v23 |= 2u;
    if ((a8 & 4) == 0) {
      return __nexus_set_opt((void *)*a1, (void *)0x15, &v21, (void *)0x38, v16, v17, v18, v19);
    }
    goto LABEL_9;
  }

  v23 |= 1u;
  if ((a8 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((a8 & 4) != 0)
  {
LABEL_9:
    v23 |= 4u;
    uint64_t v25 = a6;
    int v26 = a7;
  }

  return __nexus_set_opt((void *)*a1, (void *)0x15, &v21, (void *)0x38, v16, v17, v18, v19);
}

uint64_t os_nexus_controller_unbind_provider_instance(unsigned int *a1, __int128 *a2, __int16 a3)
{
  if (a2) {
    __int128 v11 = *a2;
  }
  __int16 v12 = a3;
  return __nexus_set_opt((void *)*a1, (void *)0x16, &v11, (void *)0x12, v6, v7, v8, v9);
}

uint64_t os_nexus_controller_read_provider_attr( unsigned int *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, unsigned int a26, int a27, unsigned int a28, unsigned int a29, uint64_t a30, unsigned int a31, unsigned int a32, unsigned int a33, unsigned int a34, unsigned int a35, unsigned int a36, __int128 a37, unsigned int a38, unsigned int a39, int a40, unsigned int a41)
{
  HIDWORD(vars8) = 256;
  if (!a3) {
    return 22LL;
  }
  (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&a9, 256LL);
  a9 = *a2;
  uint64_t result = __nexus_get_opt((void *)*a1, (void *)2, &a9, (char *)&vars8 + 4, v44, v45, v46, v47);
  if (!(_DWORD)result)
  {
    (*((void (**)(uint64_t, uint64_t))_libkernel_string_functions + 1))(a3, 176LL);
    uint64_t result = 0LL;
    uint64_t v49 = a30;
    *(void *)&__int128 v50 = a28;
    *((void *)&v50 + 1) = a29;
    *(_OWORD *)(a3 + 8) = v50;
    *(void *)&__int128 v50 = v49;
    *((void *)&v50 + 1) = HIDWORD(v49);
    *(_OWORD *)(a3 + 24) = v50;
    *(void *)&__int128 v50 = a31;
    *((void *)&v50 + 1) = a32;
    *(_OWORD *)(a3 + 40) = v50;
    unint64_t v51 = a26;
    uint64_t v52 = a26 & 1;
    *(void *)(a3 + 56) = a33;
    *(void *)(a3 + 64) = v52;
    *(void *)&__int128 v50 = a34;
    *((void *)&v50 + 1) = a35;
    *(_OWORD *)(a3 + 72) = v50;
    *(void *)&__int128 v50 = a36;
    *((void *)&v50 + 1) = a37;
    *(_OWORD *)(a3 + 88) = v50;
    uint64_t v53 = *(void *)((char *)&a37 + 4);
    uint64_t v54 = a38;
    unint64_t v55 = ((unint64_t)HIDWORD(a37) >> 1) & 1;
    *(void *)(a3 + 120) = BYTE12(a37) & 1;
    *(void *)(a3 + 128) = v55;
    *(void *)&__int128 v50 = v53;
    *((void *)&v50 + 1) = HIDWORD(v53);
    *(_OWORD *)(a3 + 104) = v50;
    *(void *)(a3 + 136) = v54;
    *(void *)(a3 + 144) = (v51 >> 1) & 1;
    BOOL v56 = a40 != 0;
    *(void *)(a3 + 152) = a39;
    *(void *)(a3 + 160) = v56;
    *(void *)(a3 + 168) = a41;
  }

  return result;
}

uint64_t os_nexus_controller_add_traffic_rule( int *a1, uint64_t a2, __int128 *a3, uint64_t *a4, char a5, _OWORD *a6)
{
  if (*(_BYTE *)a4 != 1) {
    return 45LL;
  }
  if (*((_WORD *)a4 + 1) != 12) {
    return 22LL;
  }
  if (*(_BYTE *)a3 != 2) {
    return 45LL;
  }
  if (*((_WORD *)a3 + 1) != 48) {
    return 22LL;
  }
  (*((void (**)(_BYTE *, uint64_t))_libkernel_string_functions + 1))(v15, 96LL);
  if (a2) {
    (*((void (**)(_BYTE *, uint64_t, uint64_t))_libkernel_string_functions + 11))(v15, a2, 16LL);
  }
  __int128 v12 = a3[1];
  __int128 v16 = *a3;
  __int128 v17 = v12;
  __int128 v18 = a3[2];
  uint64_t v19 = *a4;
  int v20 = *((_DWORD *)a4 + 2);
  if ((a5 & 1) != 0) {
    v21 |= 1u;
  }
  if (ioctl(*a1, 0xC0606E01uLL, v15) < 0)
  {
    char v14 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v14) {
      char v14 = &errno;
    }
    return *v14;
  }

  else
  {
    uint64_t result = 0LL;
    *a6 = v22;
  }

  return result;
}

uint64_t os_nexus_controller_remove_traffic_rule(int *a1, __int128 *a2)
{
  __int128 v6 = *a2;
  if ((ioctl(*a1, 0x80106E02uLL, &v6) & 0x80000000) == 0) {
    return 0LL;
  }
  __int128 v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v5) {
    __int128 v5 = &errno;
  }
  return *v5;
}

uint64_t os_nexus_controller_iterate_traffic_rules( int *a1, unsigned int (*a2)(uint64_t, void *), uint64_t a3)
{
  v15[0] = 2;
  uint64_t v16 = 0x2000000009CLL;
  __int128 v6 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v6) {
    return 12LL;
  }
  uint64_t v17 = v6(79872LL);
  if (!v17) {
    return 12LL;
  }
  if (ioctl(*a1, 0xC0186E03uLL, v15) < 0)
  {
    __int128 v12 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v12) {
      __int128 v12 = &errno;
    }
    uint64_t v11 = *v12;
  }

  else
  {
    unsigned int v7 = HIDWORD(v16);
    if (HIDWORD(v16))
    {
      uint64_t v8 = v17;
      unsigned int v9 = 1;
      do
      {
        (*((void (**)(void *, uint64_t))_libkernel_string_functions + 1))(v18, 48LL);
        v18[0] = v8;
        v18[1] = v8 + 16;
        v18[2] = v8 + 80;
        v18[3] = v8 + 96;
        v18[4] = v8 + 144;
        if (!a2(a3, v18)) {
          break;
        }
        v8 += 156LL;
      }

      while (v9++ < v7);
    }

    uint64_t v11 = 0LL;
  }

  char v13 = *(void (**)(uint64_t))(_libkernel_functions + 24);
  if (v13) {
    v13(v17);
  }
  return v11;
}

uint64_t os_nexus_controller_destroy( unsigned int *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = *a1;
  if ((_DWORD)result != -1) {
    uint64_t result = guarded_close_np((void *)result, a1 + 2, a3, a4, a5, a6, a7, a8);
  }
  __int128 v10 = *(uint64_t (**)(unsigned int *))(_libkernel_functions + 24);
  if (v10) {
    return v10(a1);
  }
  return result;
}

double __os_nexus_ifattach(unsigned int *a1, __int128 *a2, uint64_t a3, _OWORD *a4, int a5, _OWORD *a6)
{
  if (a3)
  {
    (*((void (**)(_OWORD *, uint64_t, uint64_t))_libkernel_string_functions + 11))(v17, a3, 64LL);
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  v17[0] = *a4;
  v18 |= 1u;
  if (a5) {
LABEL_3:
  }
    v18 |= 2u;
LABEL_4:
  (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&v20, 32LL);
  if (a2) {
    __int128 v20 = *a2;
  }
  uint64_t v21 = 0x5800000000LL;
  __int128 v22 = v17;
  if (!__nexus_set_opt((void *)*a1, (void *)0x28, &v20, (void *)0x20, v12, v13, v14, v15))
  {
    double result = v19[0];
    *a6 = *(_OWORD *)v19;
  }

  return result;
}

uint64_t __os_nexus_ifdetach(unsigned int *a1, __int128 *a2, __int128 *a3)
{
  __int128 v12 = *a3;
  (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&v13, 32LL);
  if (a2) {
    __int128 v13 = *a2;
  }
  uint64_t v14 = 0x5800000001LL;
  uint64_t v15 = v11;
  return __nexus_set_opt((void *)*a1, (void *)0x28, &v13, (void *)0x20, v6, v7, v8, v9);
}

uint64_t __os_nexus_flow_add(unsigned int *a1, __int128 *a2, uint64_t a3)
{
  if (a2) {
    __int128 v11 = *a2;
  }
  uint64_t v12 = 0x21000000014LL;
  uint64_t v13 = a3;
  return __nexus_set_opt((void *)*a1, (void *)0x28, &v11, (void *)0x20, v6, v7, v8, v9);
}

uint64_t __os_nexus_flow_del(unsigned int *a1, __int128 *a2, uint64_t a3)
{
  if (a2) {
    __int128 v11 = *a2;
  }
  uint64_t v12 = 0x21000000015LL;
  uint64_t v13 = a3;
  return __nexus_set_opt((void *)*a1, (void *)0x28, &v11, (void *)0x20, v6, v7, v8, v9);
}

uint64_t os_nexus_flow_set_wake_from_sleep(__int128 *a1, uint64_t a2, int a3)
{
  if (a3) {
    __int16 v6 = 0;
  }
  else {
    __int16 v6 = 2048;
  }
  v12[35] = v6;
  (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&v14, 32LL);
  if (a1) {
    __int128 v14 = *a1;
  }
  uint64_t v15 = 0x21000000016LL;
  uint64_t v16 = v12;
  return __nexus_set_opt((void *)0xFFFFFFFFLL, (void *)0x28, &v14, (void *)0x20, v7, v8, v9, v10);
}

uint64_t __os_nexus_get_llink_info(uint64_t result, __int128 *a2, uint64_t a3, unint64_t a4)
{
  if (HIDWORD(a4))
  {
    qword_18C50D128 = (uint64_t)"assertion failed: arg_len <= UINT32_MAX";
    __break(1u);
  }

  else
  {
    int v4 = a4;
    unsigned int v7 = (unsigned int *)result;
    (*((void (**)(__int128 *, uint64_t))_libkernel_string_functions + 1))(&v12, 32LL);
    if (a2) {
      __int128 v12 = *a2;
    }
    int v13 = 40;
    int v14 = v4;
    uint64_t v15 = a3;
    return __nexus_set_opt((void *)*v7, (void *)0x28, &v12, (void *)0x20, v8, v9, v10, v11);
  }

  return result;
}

int sigsuspend(const sigset_t *a1)
{
  if (a1) {
    a1 = (const sigset_t *)*a1;
  }
  return __sigsuspend(a1);
}

int unlink(const char *a1)
{
  int result = __unlink(a1);
  if (!result)
  {
    do
      unsigned int v2 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v2 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

int open(const char *a1, int a2, ...)
{
  uint64_t v4 = va_arg(va, void);
  if ((a2 & 0x200) != 0) {
    unsigned __int16 v2 = v4;
  }
  else {
    unsigned __int16 v2 = 0;
  }
  return __open(a1, (unsigned __int16)a2, (void *)v2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return __openat(a1, a2, a3);
}

int rmdir(const char *a1)
{
  int result = __rmdir(a1);
  if (!result)
  {
    do
      unsigned int v2 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v2 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

uint64_t work_interval_create( int32x2_t **a1, __int32 a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    int32x2_t v23 = 0LL;
    v24.i32[0] = 0;
    v24.i32[1] = a2;
    uint64_t result = __work_interval_ctl((void *)4, 0LL, &v23, (void *)0x10, a5, a6, a7, a8);
    if ((_DWORD)result == -1) {
      return result;
    }
    __int128 v10 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
    if (v10)
    {
      __int128 v11 = (int32x2_t *)v10(24LL);
      if (v11)
      {
        uint64_t v19 = v11;
        uint64_t v20 = __thread_selfid(v11, v12, v13, v14, v15, v16, v17, v18);
        uint64_t result = 0LL;
        *uint64_t v19 = (int32x2_t)v20;
        v19[1] = v23;
        v19[2] = vrev64_s32(v24);
        *a1 = v19;
        return result;
      }
    }

    uint64_t v21 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v21) {
      uint64_t v21 = &errno;
    }
    int v22 = 12;
  }

  else
  {
    uint64_t v21 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v21) {
      uint64_t v21 = &errno;
    }
    int v22 = 22;
  }

  *uint64_t v21 = v22;
  return 0xFFFFFFFFLL;
}

uint64_t work_interval_get_flags_from_port( unsigned int a1, _DWORD *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1 + 1 < 2 || a2 == 0LL)
  {
    unsigned int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v9) {
      unsigned int v9 = &errno;
    }
    *unsigned int v9 = 22;
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    uint64_t result = __work_interval_ctl((void *)9, (void *)a1, &v12, (void *)0x10, a5, a6, a7, a8);
    if ((_DWORD)result != -1)
    {
      uint64_t result = 0LL;
      *a2 = HIDWORD(v13);
    }
  }

  return result;
}

uint64_t work_interval_notify( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  v10[0] = a2;
  v10[1] = a3;
  _DWORD v10[2] = a4;
  void v10[3] = a5;
  int v11 = (int)a6;
  if (a1)
  {
    if ((*(_DWORD *)(a1 + 16) & 0x20) != 0)
    {
      return 0LL;
    }

    else
    {
      int v12 = *(_DWORD *)(a1 + 16);
      return __work_interval_ctl((void *)3, *(void **)(a1 + 8), v10, (void *)0x28, a5, a6, a7, a8);
    }
  }

  else
  {
    unsigned int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v9) {
      unsigned int v9 = &errno;
    }
    *unsigned int v9 = 22;
    return 0xFFFFFFFFLL;
  }

uint64_t work_interval_notify_simple(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = mach_absolute_time();
  return work_interval_notify(a1, a2, v8, a3, a4, 0LL, v9, v10);
}

double work_interval_instance_alloc(uint64_t a1)
{
  unsigned int v2 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (v2) {
    uint64_t v3 = v2(96LL);
  }
  else {
    uint64_t v3 = 0LL;
  }
  *(void *)(v3 + 88) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v3 + 72) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_DWORD *)(v3 + 48) = *(_DWORD *)(a1 + 16);
  *(void *)uint64_t v3 = *(void *)(a1 + 8);
  return result;
}

double work_interval_instance_clear(uint64_t a1)
{
  *(void *)(a1 + 40) = 0LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  return result;
}

uint64_t work_interval_instance_free()
{
  uint64_t v0 = *(uint64_t (**)(void))(_libkernel_functions + 24);
  if (v0) {
    return v0();
  }
  return result;
}

uint64_t work_interval_instance_set_start(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t work_interval_instance_set_deadline(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t work_interval_instance_set_finish(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t work_interval_instance_set_complexity(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t work_interval_instance_get_start(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    return *(void *)(a1 + 16);
  }
  else {
    return 0LL;
  }
}

uint64_t work_interval_instance_get_deadline(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    return *(void *)(a1 + 32);
  }
  else {
    return 0LL;
  }
}

uint64_t work_interval_instance_get_finish(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    return *(void *)(a1 + 24);
  }
  else {
    return 0LL;
  }
}

uint64_t work_interval_instance_get_complexity(uint64_t a1)
{
  if (*(void *)(a1 + 8)) {
    return *(void *)(a1 + 40);
  }
  else {
    return 0LL;
  }
}

uint64_t work_interval_instance_get_id(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

void *work_interval_instance_get_telemetry_data(uint64_t a1, void *__dst, size_t a3)
{
  if (a3 >= 0x28) {
    a3 = 40LL;
  }
  return memmove(__dst, (const void *)(a1 + 56), a3);
}

uint64_t work_interval_instance_start( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 48) & 0x20) != 0) {
      return 0LL;
    }
    else {
      return __work_interval_ctl((void *)6, *(void **)a1, (void *)a1, (void *)0x60, a5, a6, a7, a8);
    }
  }

  else
  {
    unsigned int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v9) {
      unsigned int v9 = &errno;
    }
    *unsigned int v9 = 22;
    return 0xFFFFFFFFLL;
  }

uint64_t work_interval_instance_update( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    if (!*(void *)(a1 + 8) || (*(_BYTE *)(a1 + 48) & 0x20) != 0) {
      return 0LL;
    }
    else {
      return __work_interval_ctl((void *)7, *(void **)a1, (void *)a1, (void *)0x60, a5, a6, a7, a8);
    }
  }

  else
  {
    unsigned int v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v9) {
      unsigned int v9 = &errno;
    }
    *unsigned int v9 = 22;
    return 0xFFFFFFFFLL;
  }

uint64_t work_interval_instance_finish( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    if (!*(void *)(a1 + 8) || (*(_BYTE *)(a1 + 48) & 0x20) != 0)
    {
      return 0LL;
    }

    else
    {
      uint64_t result = __work_interval_ctl((void *)8, *(void **)a1, (void *)a1, (void *)0x60, a5, a6, a7, a8);
      *(_OWORD *)(a1 + 16) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
    }
  }

  else
  {
    __int128 v10 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v10) {
      __int128 v10 = &errno;
    }
    *__int128 v10 = 22;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t work_interval_destroy( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (!a1) {
    goto LABEL_13;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    uint64_t v9 = __work_interval_ctl((void *)2, *(void **)(a1 + 8), 0LL, 0LL, a5, a6, a7, a8);
    *(void *)(a1 + 8) = 0LL;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v11 = *(int **)(StatusReg + 8);
    if (v11) {
      int v12 = *(int **)(StatusReg + 8);
    }
    else {
      int v12 = &errno;
    }
    int v13 = *v12;
    int v14 = *(void (**)(uint64_t))(_libkernel_functions + 24);
    if (v14)
    {
      v14(a1);
      int v11 = *(int **)(StatusReg + 8);
    }

    if (!v11) {
      int v11 = &errno;
    }
    *int v11 = v13;
    return v9;
  }

  if (!mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 20)))
  {
    uint64_t v17 = *(void (**)(uint64_t))(_libkernel_functions + 24);
    if (v17) {
      v17(a1);
    }
    return 0LL;
  }

  else
  {
LABEL_13:
    uint64_t v15 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v15) {
      uint64_t v15 = &errno;
    }
    *uint64_t v15 = 22;
    return 0xFFFFFFFFLL;
  }

uint64_t work_interval_join( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      unsigned int v8 = *(_DWORD *)(a1 + 20);
      if (v8 - 1 < 0xFFFFFFFE) {
        return work_interval_join_port(v8, a2, a3, a4, a5, a6, a7, a8);
      }
    }
  }

  __int128 v10 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v10) {
    __int128 v10 = &errno;
  }
  *__int128 v10 = 22;
  return 0xFFFFFFFFLL;
}

uint64_t work_interval_join_port( unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1) {
    return __work_interval_ctl((void *)5, (void *)a1, 0LL, 0LL, a5, a6, a7, a8);
  }
  uint64_t v9 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v9) {
    uint64_t v9 = &errno;
  }
  *uint64_t v9 = 22;
  return 0xFFFFFFFFLL;
}

uint64_t work_interval_leave( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  return __work_interval_ctl((void *)5, 0LL, 0LL, 0LL, a5, a6, a7, a8);
}

uint64_t work_interval_copy_port(uint64_t a1, mach_port_name_t *a2)
{
  if (a2)
  {
    if (a1 && (*(_BYTE *)(a1 + 16) & 1) != 0)
    {
      mach_port_name_t v4 = *(_DWORD *)(a1 + 20);
      uint64_t result = mach_port_mod_refs(mach_task_self_, v4, 0, 1);
      if (!(_DWORD)result)
      {
        *a2 = v4;
        return result;
      }

      *a2 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    }

    else
    {
      *a2 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    }
  }

  else
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  }

  __int16 v6 = *(int **)(StatusReg + 8);
  if (!v6) {
    __int16 v6 = &errno;
  }
  int *v6 = 22;
  return 0xFFFFFFFFLL;
}

int rename(const char *__old, const char *__new)
{
  if (!result)
  {
    do
      unsigned int v4 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v4 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

uint64_t __get_remove_counter()
{
  do
    signed int v0 = __ldaxr((unsigned int *)&__remove_counter);
  while (__stlxr(v0, (unsigned int *)&__remove_counter));
  return v0;
}

void __inc_remove_counter()
{
  do
    unsigned int v0 = __ldaxr((unsigned int *)&__remove_counter);
  while (__stlxr(v0 + 1, (unsigned int *)&__remove_counter));
}

uint64_t pselect_DARWIN_EXTSN( int a1, fd_set *a2, fd_set *a3, fd_set *a4, const timespec *a5, const sigset_t *a6)
{
  p___darwin_time_t tv_sec = (timespec *)a5;
  uint64_t v12 = __pselect(a1, a2, a3, a4, a5, a6);
  if ((_DWORD)v12 == -1)
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v14 = *(int **)(StatusReg + 8);
    if (!v14) {
      int v14 = &errno;
    }
    if (*v14 == 78)
    {
      if (p_tv_sec)
      {
        uint64_t tv_nsec = p_tv_sec->tv_nsec;
        __darwin_time_t tv_sec = p_tv_sec->tv_sec;
        int v21 = (int)tv_nsec / 1000;
        p___darwin_time_t tv_sec = (timespec *)&tv_sec;
      }

      if (a6)
      {
        uint64_t v12 = __pthread_sigmask(3, a6, &v22);
        if (!(_DWORD)v12)
        {
          uint64_t v12 = select_DARWIN_EXTSN(a1, a2, a3, a4, (timeval *)p_tv_sec);
          uint64_t v16 = *(int **)(StatusReg + 8);
          if (!v16) {
            uint64_t v16 = &errno;
          }
          int v17 = *v16;
          __pthread_sigmask(3, &v22, 0LL);
          int v18 = *(int **)(StatusReg + 8);
          if (!v18) {
            int v18 = &errno;
          }
          *int v18 = v17;
        }
      }

      else
      {
        return select_DARWIN_EXTSN(a1, a2, a3, a4, (timeval *)p_tv_sec);
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v12;
}

uint64_t os_cpu_in_cksum(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x40 || (a2 & 3) != 0)
  {
    v12[0] = 0LL;
    v12[1] = 0LL;
    __n128 v12[2] = a1;
    unsigned int v13 = a2;
    return os_cpu_in_cksum_mbuf(v12);
  }

  unint64_t v3 = a3;
  if (a2)
  {
    if (a2 == 20)
    {
      unint64_t v4 = *a1;
      uint64_t v5 = 4LL;
      uint64_t v6 = 3LL;
      uint64_t v7 = 2LL;
      uint64_t v8 = 1LL;
    }

    else
    {
      if (a2 != 32)
      {
        do
        {
          unsigned int v9 = *a1++;
          v3 += v9;
          a2 -= 4;
        }

        while (a2);
        goto LABEL_12;
      }

      unint64_t v3 = a1[3];
      unint64_t v4 = *a1 + (unint64_t)a3 + a1[1] + (unint64_t)a1[2];
      uint64_t v5 = 7LL;
      uint64_t v6 = 6LL;
      uint64_t v7 = 5LL;
      uint64_t v8 = 4LL;
    }

    v3 += v4 + a1[v8] + a1[v7] + (unint64_t)a1[v6] + a1[v5];
  }

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  if ((a4 & 4) == 0) {
    return __open_dprotected_np(a1, a2, a3, a4);
  }
  unint64_t v4 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
  if (!v4) {
    unint64_t v4 = &errno;
  }
  int *v4 = 22;
  return -1;
}

int openat_dprotected_np(int a1, const char *a2, int a3, int a4, int a5, ...)
{
  uint64_t v9 = va_arg(va, void);
  if ((a5 & 4) != 0)
  {
    uint64_t v7 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v7) {
      uint64_t v7 = &errno;
    }
    int *v7 = 22;
    return -1;
  }

  else
  {
    if ((a3 & 0x200) != 0) {
      unint64_t v6 = v9;
    }
    else {
      unint64_t v6 = 0LL;
    }
    return __openat_dprotected_np( *(void **)&a1,  (void *)a2,  *(void **)&a3,  *(void **)&a4,  *(void **)&a5,  (void *)v6,  (void *)0xFFFFFFFFLL,  v5);
  }

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  if ((a3 & 0x200) != 0)
  {
    uint64_t v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v5) {
      uint64_t v5 = &errno;
    }
    int v6 = 22;
    goto LABEL_9;
  }

  if (a4 <= -2)
  {
    uint64_t v5 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v5) {
      uint64_t v5 = &errno;
    }
    int v6 = 9;
LABEL_9:
    int *v5 = v6;
    return -1;
  }

  return __openat_dprotected_np( *(void **)&a1,  (void *)a2,  *(void **)&a3,  (void *)0xFFFFFFFFLL,  (void *)4,  0LL,  *(void **)&a4,  v4);
}

int proc_listpidspath( uint32_t type, uint32_t typeinfo, const char *path, uint32_t pathflags, void *buffer, int buffersize)
{
  uint64_t v8 = *(void **)&typeinfo;
  uint64_t v9 = *(void **)&type;
  if (!buffer)
  {
    int v12 = __proc_info((void *)1, *(void **)&type, *(void **)&typeinfo, 0LL, 0LL, 0LL, v6, v7);
    if (v12 == -1) {
      return 0;
    }
    else {
      return v12;
    }
  }

  if (buffersize <= 3)
  {
    unint64_t v11 = *(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!v11) {
      unint64_t v11 = &errno;
    }
    *unint64_t v11 = 12;
    return -1;
  }

  int v14 = *(uint64_t (**)(uint64_t))(_libkernel_functions + 16);
  if (!v14) {
    return -1;
  }
  uint64_t v15 = buffer;
  uint64_t v18 = v14(224LL);
  if (!v18) {
    return -1;
  }
  uint64_t v19 = v18;
  *(void *)uint64_t v18 = 0LL;
  *(_DWORD *)(v18 + 8) = 0;
  *(void *)(v18 + 16) = 0LL;
  uint64_t v20 = (unint64_t *)(v18 + 16);
  *(void *)(v18 + 40) = 0LL;
  v105 = (unint64_t *)(v18 + 40);
  *(void *)(v18 + 64) = 0LL;
  int v21 = (int *)(v18 + 72);
  *(void *)(v18 + 24) = 0LL;
  *(_DWORD *)(v18 + 32) = 0;
  *(void *)(v18 + 48) = 0LL;
  *(_DWORD *)(v18 + 56) = 0;
  if (stat64(path, (stat *)(v18 + 72)) == -1)
  {
    uint64_t v46 = *(void (**)(uint64_t))(_libkernel_functions + 24);
    if (v46) {
      v46(v19);
    }
    return -1;
  }

  *(_DWORD *)(v19 + 216) = pathflags;
  int v24 = __proc_info((void *)1, v9, v8, 0LL, 0LL, 0LL, v22, v23);
  if (v24 == -1) {
    LODWORD(v27) = 0;
  }
  else {
    LODWORD(v27) = v24;
  }
  if ((int)v27 < 1)
  {
LABEL_65:
    int v13 = -1;
    goto LABEL_66;
  }

  unsigned int v103 = buffersize & 0xFFFFFFFC;
  unint64_t v28 = *v20;
  do
  {
    if (v28 >= (int)v27)
    {
      __int16 v34 = *(void **)v19;
    }

    else
    {
      unint64_t v27 = (int)v27;
      unint64_t v29 = v28 + 128 + ((v27 + ~v28) & 0xFFFFFFFFFFFFFF80LL);
      *(void *)(v19 + 16) = v29;
      int v30 = *(void **)v19;
      uint64_t v31 = _libkernel_functions;
      if (*(void *)v19)
      {
        uint64_t v32 = *(uint64_t (**)(void))(_libkernel_functions + 32);
        if (!v32) {
          goto LABEL_199;
        }
        uint64_t v33 = v32(*(void *)v19);
        if (!v33)
        {
          uint64_t v31 = _libkernel_functions;
LABEL_199:
          int v97 = *(void (**)(void *))(v31 + 24);
          if (v97) {
            v97(v30);
          }
LABEL_201:
          *(void *)uint64_t v19 = 0LL;
LABEL_202:
          int v13 = -1;
          goto LABEL_203;
        }

        __int16 v34 = (void *)v33;
        *(void *)uint64_t v19 = v33;
      }

      else
      {
        BOOL v35 = *(uint64_t (**)(unint64_t))(_libkernel_functions + 16);
        if (!v35) {
          goto LABEL_201;
        }
        __int16 v34 = (void *)v35(v29);
        *(void *)uint64_t v19 = v34;
        if (!v34) {
          goto LABEL_202;
        }
      }

      unint64_t v28 = *v20;
    }

    unsigned int v36 = __proc_info((void *)1, v9, v8, 0LL, v34, (void *)v28, v25, v26);
    if (v36 == -1) {
      unint64_t v37 = 0LL;
    }
    else {
      unint64_t v37 = v36;
    }
    unint64_t v28 = *v20;
    LODWORD(v27) = *v20 + 4;
  }

  while (v37 + 4 >= *v20);
  *(_DWORD *)(v19 + 8) = v37 >> 2;
  if (v37 >= 4)
  {
    int v13 = 0;
    uint64_t v49 = v37 >> 2;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v102 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    signed int v38 = v103;
    while (1)
    {
      __int128 v50 = (void *)*(unsigned int *)(*(void *)v19 + 4LL * (v49 - 1));
      if (!(_DWORD)v50) {
        goto LABEL_150;
      }
      int v51 = __proc_info( (void *)2,  (void *)*(unsigned int *)(*(void *)v19 + 4LL * (v49 - 1)),  (void *)9,  0LL,  &v106,  (void *)0x930,  v25,  v26);
      if (v51 == -1) {
        int v52 = 0;
      }
      else {
        int v52 = v51;
      }
      if (v52 < 1)
      {
        uint64_t v54 = *(int **)(StatusReg + 8);
        if (!v54) {
          uint64_t v54 = &errno;
        }
        if (*v54 != 3) {
          goto LABEL_150;
        }
      }

      else
      {
        if (v52 < 0x930)
        {
          int v53 = -1;
          goto LABEL_148;
        }

        if (v106 && v106 == *v21 && ((*(_BYTE *)(v19 + 216) & 1) != 0 || v107 == *(void *)(v19 + 80))
          || v116 && v116 == *v21 && ((*(_BYTE *)(v19 + 216) & 1) != 0 || v117 == *(void *)(v19 + 80)))
        {
          int v53 = 1;
          goto LABEL_148;
        }
      }

      int v55 = __proc_info((void *)2, v50, (void *)1, 0LL, 0LL, 0LL, v25, v26);
      if (v55 == -1) {
        LODWORD(v56) = 0;
      }
      else {
        LODWORD(v56) = v55;
      }
      unint64_t v57 = *(void *)(v19 + 64);
      do
      {
        if (v57 >= (int)v56)
        {
          uint64_t v63 = *(void **)(v19 + 48);
        }

        else
        {
          unint64_t v56 = (int)v56;
          unint64_t v58 = ((v56 + ~v57) & 0xFFFFFFFFFFFFFF00LL) + v57 + 256;
          *(void *)(v19 + 64) = v58;
          uint64_t v59 = *(void *)(v19 + 48);
          uint64_t v60 = _libkernel_functions;
          if (v59)
          {
            unsigned int v61 = *(uint64_t (**)(void))(_libkernel_functions + 32);
            if (!v61) {
              goto LABEL_137;
            }
            uint64_t v62 = v61(*(void *)(v19 + 48));
            if (!v62)
            {
              uint64_t v60 = _libkernel_functions;
LABEL_137:
              uint64_t v76 = *(void (**)(uint64_t))(v60 + 24);
              if (v76) {
                v76(v59);
              }
LABEL_139:
              *(void *)(v19 + 48) = 0LL;
              goto LABEL_150;
            }

            uint64_t v63 = (void *)v62;
            *(void *)(v19 + 48) = v62;
          }

          else
          {
            unsigned int v64 = *(uint64_t (**)(unint64_t))(_libkernel_functions + 16);
            if (!v64) {
              goto LABEL_139;
            }
            uint64_t v63 = (void *)v64(v58);
            *(void *)(v19 + 48) = v63;
            if (!v63) {
              goto LABEL_150;
            }
          }

          unint64_t v57 = *(void *)(v19 + 64);
        }

        unsigned int v65 = __proc_info((void *)2, v50, (void *)1, 0LL, v63, (void *)v57, v25, v26);
        if (v65 == -1) {
          uint64_t v66 = 0LL;
        }
        else {
          uint64_t v66 = v65;
        }
        unint64_t v57 = *(void *)(v19 + 64);
        LODWORD(v56) = v57 + 8;
      }

      while (v66 + 8 >= v57);
      *(_DWORD *)(v19 + 56) = v66 >> 3;
      if (v66 < 8)
      {
LABEL_130:
        int v74 = __proc_info((void *)2, v50, (void *)2, 0LL, v118, (void *)0xE8, v25, v26);
        if (v74 == -1) {
          int v75 = 0;
        }
        else {
          int v75 = v74;
        }
        if (v75 > 0)
        {
          if ((v118[1] & 1) == 0) {
            goto LABEL_146;
          }
          LODWORD(v79) = 8 * v119;
          unint64_t v80 = *v105;
          do
          {
            if (v80 >= (int)v79)
            {
              uint64_t v86 = *(void **)(v19 + 24);
            }

            else
            {
              unint64_t v79 = (int)v79;
              unint64_t v81 = ((v79 + ~v80) & 0xFFFFFFFFFFFFFF00LL) + v80 + 256;
              *(void *)(v19 + 40) = v81;
              uint64_t v82 = *(void *)(v19 + 24);
              uint64_t v83 = _libkernel_functions;
              if (v82)
              {
                __int16 v84 = *(uint64_t (**)(void))(_libkernel_functions + 32);
                if (!v84) {
                  goto LABEL_194;
                }
                uint64_t v85 = v84(*(void *)(v19 + 24));
                if (!v85)
                {
                  uint64_t v83 = _libkernel_functions;
LABEL_194:
                  v96 = *(void (**)(uint64_t))(v83 + 24);
                  if (v96) {
                    v96(v82);
                  }
LABEL_196:
                  *(void *)(v19 + 24) = 0LL;
LABEL_135:
                  int v53 = -1;
                  goto LABEL_147;
                }

                uint64_t v86 = (void *)v85;
                *(void *)(v19 + 24) = v85;
              }

              else
              {
                int v87 = *(uint64_t (**)(unint64_t))(_libkernel_functions + 16);
                if (!v87) {
                  goto LABEL_196;
                }
                uint64_t v86 = (void *)v87(v81);
                *(void *)(v19 + 24) = v86;
                if (!v86) {
                  goto LABEL_135;
                }
              }

              unint64_t v80 = *v105;
            }

            unsigned int v88 = __proc_info((void *)2, v50, (void *)6, 0LL, v86, (void *)v80, v25, v26);
            if (v88 == -1) {
              uint64_t v89 = 0LL;
            }
            else {
              uint64_t v89 = v88;
            }
            unint64_t v80 = *v105;
            LODWORD(v79) = *v105 + 8;
          }

          while (v89 + 8 >= *v105);
          *(_DWORD *)(v19 + 32) = v89 >> 3;
          if (v89 < 8)
          {
LABEL_146:
            int v53 = 0;
            goto LABEL_147;
          }

          uint64_t v90 = 0LL;
          while (2)
          {
            int v91 = __proc_info( (void *)2,  v50,  (void *)0xA,  *(void **)(*(void *)(v19 + 24) + 8 * v90),  &v106,  (void *)0x508,  v25,  v26);
            if (v91 == -1) {
              int v92 = 0;
            }
            else {
              int v92 = v91;
            }
            if (v92 > 0)
            {
              goto LABEL_178;
            }

            size_t v93 = *(int **)(v102 + 8);
            if (!v93) {
              size_t v93 = &errno;
            }
            int v94 = *v93;
            if (v94 != 3 && v94 != 22)
            {
LABEL_178:
              if (v114 && v114 == *v21 && ((*(_BYTE *)(v19 + 216) & 1) != 0 || v115 == *(void *)(v19 + 80)))
              {
                int v53 = 1;
                goto LABEL_147;
              }
            }

            int v53 = 0;
            continue;
          }
        }

        uint64_t v77 = *(int **)(StatusReg + 8);
        if (!v77) {
          uint64_t v77 = &errno;
        }
        if (*v77 == 3) {
          int v53 = 0;
        }
        else {
          int v53 = -1;
        }
LABEL_147:
        signed int v38 = v103;
LABEL_148:
        if (v53 == 1) {
          goto LABEL_149;
        }
        goto LABEL_150;
      }

      uint64_t v67 = 0LL;
      uint64_t v68 = 0LL;
      while (1)
      {
        uint64_t v69 = *(void *)(v19 + 48);
        if (*(_DWORD *)(v69 + v67 + 4) != 1) {
          goto LABEL_129;
        }
        int v70 = __proc_info((void *)3, v50, (void *)1, (void *)*(int *)(v69 + v67), &v106, (void *)0xB0, v25, v26);
        int v71 = v70 == -1 ? 0 : v70;
        if (v71 > 0) {
          break;
        }
        int v73 = *(int **)(StatusReg + 8);
        if (!v73) {
          int v73 = &errno;
        }
        if (*v73 != 2)
        {
LABEL_153:
          signed int v38 = v103;
          goto LABEL_150;
        }

LABEL_129:
        ++v68;
        v67 += 8LL;
      }

      int v72 = *(_DWORD *)(v19 + 216);
      if ((v72 & 2) != 0 && (v106 & 0x8000) != 0
        || !v108
        || v108 != *v21
        || (v72 & 1) == 0 && v109 != *(void *)(v19 + 80))
      {
        goto LABEL_129;
      }

      signed int v38 = v103;
LABEL_149:
      *v15++ = (_DWORD)v50;
      v13 += 4;
      if (v13 >= v38) {
        goto LABEL_35;
      }
LABEL_150:
      if (v49-- <= 1) {
        goto LABEL_35;
      }
    }
  }

  int v13 = 0;
  signed int v38 = v103;
LABEL_35:
  if (v13 < v38)
  {
    uint64_t v39 = *(unsigned int *)(v19 + 8);
    if ((int)v39 >= 1)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      do
      {
        --v39;
        uint64_t v40 = (void *)*(unsigned int *)(*(void *)v19 + 4 * v39);
        if ((_DWORD)v40)
        {
          if ((*(_BYTE *)(v19 + 216) & 1) != 0)
          {
            int v44 = __proc_info( (void *)2,  (void *)*(unsigned int *)(*(void *)v19 + 4 * v39),  (void *)0x17,  (void *)*v21,  &v106,  (void *)0x4F8,  v25,  v26);
            if (v44 == -1) {
              int v45 = 0;
            }
            else {
              int v45 = v44;
            }
            if (v45 >= 1272
              && v112
              && v112 == *v21
              && ((*(_BYTE *)(v19 + 216) & 1) != 0 || v113 == *(void *)(v19 + 80)))
            {
LABEL_58:
              *v15++ = (_DWORD)v40;
              v13 += 4;
              if (v13 >= v38) {
                break;
              }
            }
          }

          else
          {
            for (uint64_t i = 0LL; ; uint64_t i = (void *)(v111 + v110))
            {
              int v42 = __proc_info((void *)2, v40, (void *)0x16, i, &v106, (void *)0x4F8, v25, v26);
              int v43 = v42 == -1 ? 0 : v42;
              if (v43 < 1272) {
                break;
              }
              if (v112 && v112 == *v21 && ((*(_BYTE *)(v19 + 216) & 1) != 0 || v113 == *(void *)(v19 + 80))) {
                goto LABEL_58;
              }
            }
          }
        }
      }

      while ((int)v39 > 0);
    }
  }

LABEL_66:
  if (*(void *)v19)
  {
    unsigned int v48 = *(void (**)(void))(_libkernel_functions + 24);
    if (v48) {
      v48();
    }
  }

LABEL_203:
  uint64_t v98 = _libkernel_functions;
  if (*(void *)(v19 + 24))
  {
    v99 = *(void (**)(void))(_libkernel_functions + 24);
    if (v99)
    {
      v99();
      uint64_t v98 = _libkernel_functions;
    }
  }

  if (*(void *)(v19 + 48))
  {
    v100 = *(void (**)(void))(v98 + 24);
    if (v100)
    {
      v100();
      uint64_t v98 = _libkernel_functions;
    }
  }

  v101 = *(void (**)(uint64_t))(v98 + 24);
  if (v101) {
    v101(v19);
  }
  return v13;
}

uint64_t os_channel_event_get_next_event(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  *a3 = 0LL;
  if (!a1) {
    return 22LL;
  }
  if ((a1 & 3) == 1)
  {
    unint64_t v3 = (a1 & 0xFFFFFFFFFFFFFFF0LL) + 32;
  }

  else
  {
    if ((a1 & 3) != 2) {
      return 22LL;
    }
    unint64_t v3 = (a1 & 0xFFFFFFFFFFFFFFF0LL) + 32;
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x28))
    {
      unint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFFF0LL) + 0x20);
      if (!v3) {
        return 22LL;
      }
    }
  }

  uint64_t v5 = *(void *)(v3 + 8);
  if (v5)
  {
    uint64_t v6 = *(unsigned __int16 *)(v3 + 36);
    uint64_t v7 = v5 + *(unsigned int *)(v3 + 32);
    if (a2)
    {
      if ((*(_BYTE *)(a2 + 4) & 1) == 0) {
        return 96LL;
      }
      unint64_t v8 = a2 + *(unsigned __int16 *)(a2 + 10) + 12;
      if (v8 < v7 + 8) {
        return 6LL;
      }
    }

    else
    {
      unint64_t v8 = v7 + 8;
    }

    if (v8 + *(unsigned __int16 *)(v8 + 10) <= v7 + v6)
    {
      uint64_t result = 0LL;
      *a3 = v8;
      return result;
    }
  }

  return 6LL;
}

uint64_t os_channel_event_get_event_data(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    if ((*(_DWORD *)a1 - 3) < 0xFFFFFFFE)
    {
      return 6LL;
    }

    else
    {
      uint64_t result = 0LL;
      int v4 = *(_DWORD *)(a1 + 4) & 1;
      *(_DWORD *)a2 = *(_DWORD *)a1;
      *(_DWORD *)(a2 + 4) = v4;
      *(_WORD *)(a2 + 8) = *(_WORD *)(a1 + 10);
      *(void *)(a2 + 16) = a1 + 12;
    }
  }

  return result;
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_type_trap(task, name, ptype);
  if (result == 268435459) {
    return _kernelrpc_mach_port_type(task, name, ptype);
  }
  return result;
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_allocate_trap(task, right, name);
  if (result == 268435459) {
    return _kernelrpc_mach_port_allocate(task, right, name);
  }
  return result;
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_deallocate_trap(task, name);
  if (result == 268435459) {
    return _kernelrpc_mach_port_deallocate(task, name);
  }
  return result;
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_mod_refs_trap(task, name, right, delta);
  if (result == 268435459) {
    return _kernelrpc_mach_port_mod_refs(task, name, right, delta);
  }
  return result;
}

kern_return_t mach_port_move_member(ipc_space_t task, mach_port_name_t member, mach_port_name_t after)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_move_member_trap(task, member, after);
  if (result == 268435459) {
    return _kernelrpc_mach_port_move_member(task, member, after);
  }
  return result;
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  kern_return_t result;
  unsigned __int8 v8 = notifyPoly;
  uint64_t result = _kernelrpc_mach_port_request_notification_trap(task, name, msgid, sync, notify, notifyPoly, previous);
  if (result == 268435459) {
    return _kernelrpc_mach_port_request_notification(task, name, msgid, sync, notify, v8, previous);
  }
  return result;
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  kern_return_t result;
  unsigned __int8 v4 = polyPoly;
  uint64_t result = _kernelrpc_mach_port_insert_right_trap(task, name, poly, polyPoly);
  if (result == 268435459) {
    return _kernelrpc_mach_port_insert_right(task, name, poly, v4);
  }
  return result;
}

kern_return_t mach_port_get_attributes( ipc_space_inspect_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  kern_return_t result;
  uint64_t result = _kernelrpc_mach_port_get_attributes_trap(task, name, flavor, port_info_out, port_info_outCnt);
  if (result == 268435459) {
    return _kernelrpc_mach_port_get_attributes(task, name, flavor, port_info_out, (int *)port_info_outCnt);
  }
  return result;
}

int64_t mig_get_special_reply_port( uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int64_t result = *(unsigned int *)(StatusReg + 64);
  if ((result - 1) >= 0xFFFFFFFE)
  {
    int64_t result = thread_get_special_reply_port((void *)result, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(StatusReg + 64) = result;
  }

  return result;
}

uint64_t mig_dealloc_special_reply_port(uint64_t result)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v2 = *(_DWORD *)(StatusReg + 64);
  if ((v2 - 1) <= 0xFFFFFFFD)
  {
    mach_port_name_t v3 = result;
    int64_t result = mach_port_destruct(mach_task_self_, *(_DWORD *)(StatusReg + 64), -1, 0LL);
    if (v2 != v3) {
      int64_t result = mach_port_deallocate(mach_task_self_, v3);
    }
    *(void *)(StatusReg + 64) = 0LL;
  }

  return result;
}

kern_return_t mach_port_destruct( ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_destruct_trap(task, name, srdelta, guard);
  if (result == 268435459) {
    return _kernelrpc_mach_port_destruct(task, name, srdelta, guard);
  }
  return result;
}

uint64_t thread_destruct_special_reply_port(mach_port_name_t name, int a2)
{
  switch(a2)
  {
    case 2:
      return mach_port_deallocate(mach_task_self_, name);
    case 1:
      mach_port_t v3 = mach_task_self_;
      mach_port_name_t v4 = name;
      mach_port_delta_t v5 = 0;
      return mach_port_destruct(v3, v4, v5, 0LL);
    case 0:
      mach_port_t v3 = mach_task_self_;
      mach_port_name_t v4 = name;
      mach_port_delta_t v5 = -1;
      return mach_port_destruct(v3, v4, v5, 0LL);
  }

  return 4LL;
}

uint64_t mach_sync_ipc_link_monitoring_start( mach_port_name_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  *a1 = -1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  mach_port_name_t special_reply_port = *(_DWORD *)(StatusReg + 64);
  if (special_reply_port - 1 >= 0xFFFFFFFE)
  {
    mach_port_name_t special_reply_port = thread_get_special_reply_port(a1, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(StatusReg + 64) = special_reply_port;
  }

  uint64_t v11 = mach_port_mod_refs(mach_task_self_, special_reply_port, 0, 1);
  if (!(_DWORD)v11)
  {
    uint64_t v11 = _kernelrpc_mach_port_special_reply_port_reset_link(mach_task_self_, special_reply_port, &v13);
    if ((_DWORD)v11) {
      mach_port_deallocate(mach_task_self_, special_reply_port);
    }
    else {
      *a1 = special_reply_port;
    }
  }

  return v11;
}

uint64_t mach_sync_ipc_link_monitoring_stop(unsigned int a1, _DWORD *a2)
{
  int v6 = 1;
  uint64_t v4 = _kernelrpc_mach_port_special_reply_port_reset_link(mach_task_self_, a1, &v6);
  *a2 = v6 == 0;
  mach_port_deallocate(mach_task_self_, a1);
  return v4;
}

kern_return_t mach_port_kernel_object( ipc_space_inspect_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  kern_return_t result;
  uint64_t v6;
  int64_t result = _kernelrpc_mach_port_kobject(task, name, object_type, &v6);
  if (object_addr)
  {
    if (!result) {
      *object_addr = v6;
    }
  }

  return result;
}

kern_return_t mach_port_insert_member(ipc_space_t task, mach_port_name_t name, mach_port_name_t pset)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_insert_member_trap(task, name, pset);
  if (result == 268435459) {
    return _kernelrpc_mach_port_insert_member(task, name, pset);
  }
  return result;
}

kern_return_t mach_port_extract_member(ipc_space_t task, mach_port_name_t name, mach_port_name_t pset)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_extract_member_trap(task, name, pset);
  if (result == 268435459) {
    return _kernelrpc_mach_port_extract_member(task, name, pset);
  }
  return result;
}

kern_return_t mach_port_get_context( ipc_space_inspect_t task, mach_port_name_t name, mach_port_context_t *context)
{
  kern_return_t result;
  mach_port_context_t v5;
  int64_t result = _kernelrpc_mach_port_get_context(task, name, &v5);
  if (!result) {
    *context = v5;
  }
  return result;
}

kern_return_t mach_port_construct( ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_construct_trap(task, options, context, name);
  if (result == 268435459) {
    return _kernelrpc_mach_port_construct(task, (uint64_t)options, context, name);
  }
  return result;
}

kern_return_t mach_port_guard( ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_guard_trap(task, name, guard, strict);
  if (result == 268435459) {
    return _kernelrpc_mach_port_guard(task, name, guard, strict);
  }
  return result;
}

kern_return_t mach_port_unguard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_port_unguard_trap(task, name, guard);
  if (result == 268435459) {
    return _kernelrpc_mach_port_unguard(task, name, guard);
  }
  return result;
}

kern_return_t mach_voucher_extract_attr_recipe( ipc_voucher_t voucher, mach_voucher_attr_key_t key, mach_voucher_attr_raw_recipe_t recipe, mach_msg_type_number_t *recipeCnt)
{
  kern_return_t result;
  int64_t result = mach_voucher_extract_attr_recipe_trap(voucher, key, recipe, recipeCnt);
  if (result == 268435459) {
    return _kernelrpc_mach_voucher_extract_attr_recipe(voucher, key, recipe, (int *)recipeCnt);
  }
  return result;
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  kern_return_t trap;
  BOOL v9;
  trap = _kernelrpc_mach_vm_allocate_trap(target, address, size, flags);
  if (trap == 268435459) {
    trap = _kernelrpc_mach_vm_allocate(target, (uint64_t *)address, size, flags);
  }
  if ((flags & 0xFF000000) != 0x1E000000)
  {
    if (__syscall_logger) {
      uint64_t v9 = trap == 0;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v9) {
      __syscall_logger(flags & 0xFF000000 | 0x10, target, size, 0LL, *address, 0LL);
    }
  }

  return trap;
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  kern_return_t result;
  if (__syscall_logger) {
    __syscall_logger(32LL, target, address, size, 0LL, 0LL);
  }
  int64_t result = _kernelrpc_mach_vm_deallocate_trap(target, address, size);
  if (result == 268435459) {
    return _kernelrpc_mach_vm_deallocate(target, address, size);
  }
  return result;
}

kern_return_t mach_vm_protect( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_vm_protect_trap(target_task, address, size, set_maximum, new_protection);
  if (result == 268435459) {
    return _kernelrpc_mach_vm_protect(target_task, address, size, set_maximum, new_protection);
  }
  return result;
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  kern_return_t result;
  mach_vm_address_t addressa;
  addressa = *address;
  int64_t result = mach_vm_allocate(target_task, &addressa, size, flags);
  *mach_vm_address_t address = addressa;
  return result;
}

kern_return_t mach_vm_map( vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  kern_return_t v22;
  kern_return_t v23;
  BOOL v24;
  mach_vm_size_t v13 = size;
  int v14 = (uint64_t *)address;
  vm_map_t v15 = target_task;
  if (object) {
    goto LABEL_8;
  }
  if (max_protection != 7 || inheritance != 1) {
    goto LABEL_8;
  }
  mach_vm_offset_t v17 = mask;
  BOOLean_t v18 = copy;
  memory_object_offset_t v21 = offset;
  sigset_t v22 = _kernelrpc_mach_vm_map_trap(target_task, address, size, mask, flags, cur_protection);
  mask = v17;
  offset = v21;
  mach_vm_size_t v13 = size;
  int v14 = (uint64_t *)address;
  vm_map_t v15 = target_task;
  copy = v18;
  int32x2_t v23 = v22;
  if (v22 == 268435459) {
LABEL_8:
  }
    int32x2_t v23 = _kernelrpc_mach_vm_map( v15,  v14,  v13,  mask,  flags,  object,  offset,  copy,  __SPAIR64__(max_protection, cur_protection),  inheritance);
  if ((flags & 0xFF000000) != 0x1E000000)
  {
    if (__syscall_logger) {
      int v24 = v23 == 0;
    }
    else {
      int v24 = 0;
    }
    if (v24) {
      __syscall_logger(flags & 0xFF000000 | 0x90, v15, v13, 0LL, *v14, 0LL);
    }
  }

  return v23;
}

kern_return_t mach_vm_remap( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  kern_return_t v15;
  kern_return_t v16;
  BOOL v17;
  vm_map_t v15 = _kernelrpc_mach_vm_remap( target_task,  (uint64_t *)target_address,  size,  mask,  flags,  src_task,  src_address,  copy,  cur_protection,  max_protection,  inheritance);
  uint64_t v16 = v15;
  if (__syscall_logger) {
    mach_vm_offset_t v17 = v15 == 0;
  }
  else {
    mach_vm_offset_t v17 = 0;
  }
  if (v17) {
    __syscall_logger(flags & 0xFF000000 | 0x90, target_task, size, 0LL, *target_address, 0LL);
  }
  return v16;
}

kern_return_t mach_vm_remap_new( vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  kern_return_t v15;
  kern_return_t v16;
  BOOL v17;
  vm_map_t v15 = _kernelrpc_mach_vm_remap_new( target_task,  (uint64_t *)target_address,  size,  mask,  flags,  src_task,  src_address,  copy,  cur_protection,  max_protection,  inheritance);
  uint64_t v16 = v15;
  if (__syscall_logger) {
    mach_vm_offset_t v17 = v15 == 0;
  }
  else {
    mach_vm_offset_t v17 = 0;
  }
  if (v17) {
    __syscall_logger(flags & 0xFF000000 | 0x90, target_task, size, 0LL, *target_address, 0LL);
  }
  return v16;
}

kern_return_t mach_vm_read( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  BOOL v9;
  uint64_t v7 = _kernelrpc_mach_vm_read(target_task, address, size, data, dataCnt);
  unsigned __int8 v8 = v7;
  if (__syscall_logger) {
    uint64_t v9 = v7 == 0;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9) {
    __syscall_logger(144LL, mach_task_self_, *dataCnt, 0LL, *data, 0LL);
  }
  return v8;
}

kern_return_t vm_map( vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  kern_return_t v15;
  kern_return_t v16;
  BOOL v17;
  vm_map_t v15 = _kernelrpc_vm_map( target_task,  (uint64_t *)address,  size,  mask,  flags,  object,  offset,  copy,  *(uint64_t *)&cur_protection,  inheritance);
  uint64_t v16 = v15;
  if (__syscall_logger) {
    mach_vm_offset_t v17 = v15 == 0;
  }
  else {
    mach_vm_offset_t v17 = 0;
  }
  if (v17) {
    __syscall_logger(flags & 0xFF000000 | 0x90, target_task, size, 0LL, *address, 0LL);
  }
  return v16;
}

kern_return_t vm_remap( vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  kern_return_t v15;
  vm_map_t v15 = _kernelrpc_vm_remap( target_task,  (uint64_t *)target_address,  size,  mask,  flags,  src_task,  src_address,  copy,  cur_protection,  max_protection,  inheritance);
  if (__syscall_logger) {
    __syscall_logger(flags & 0xFF000000 | 0x90, target_task, size, 0LL, *target_address, 0LL);
  }
  return v15;
}

kern_return_t vm_remap_new( vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_read_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  kern_return_t v15;
  vm_map_t v15 = _kernelrpc_vm_remap_new( target_task,  (uint64_t *)target_address,  size,  mask,  flags,  src_task,  src_address,  copy,  cur_protection,  max_protection,  inheritance);
  if (__syscall_logger) {
    __syscall_logger(flags & 0xFF000000 | 0x90, target_task, size, 0LL, *target_address, 0LL);
  }
  return v15;
}

kern_return_t vm_read( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  BOOL v9;
  uint64_t v7 = _kernelrpc_vm_read(target_task, address, size, data, dataCnt);
  unsigned __int8 v8 = v7;
  if (__syscall_logger) {
    uint64_t v9 = v7 == 0;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9) {
    __syscall_logger(144LL, mach_task_self_, *dataCnt, 0LL, *data, 0LL);
  }
  return v8;
}

kern_return_t mach_vm_purgable_control( vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  kern_return_t result;
  int64_t result = _kernelrpc_mach_vm_purgable_control_trap(target_task, address, control, state);
  if (result == 268435459) {
    return _kernelrpc_mach_vm_purgable_control(target_task, address, control, state);
  }
  return result;
}

int getaudit(auditinfo *a1)
{
  int result = getaudit_addr(&v4, 48);
  if (!result)
  {
    a1->ai_auid = v4.ai_auid;
    a1->ai_mask = v4.ai_mask;
    u_int32_t v3 = v4.ai_termid.at_addr[0];
    a1->ai_termid.port = v4.ai_termid.at_port;
    a1->ai_termid.machine = v3;
    a1->ai_asid = v4.ai_asid;
  }

  return result;
}

int setaudit(const auditinfo *a1)
{
  int result = getaudit_addr(&v5, 48);
  if (!result)
  {
    v5.ai_auid = a1->ai_auid;
    v5.ai_mask = a1->ai_mask;
    u_int32_t machine = a1->ai_termid.machine;
    v5.ai_termid.at_port = a1->ai_termid.port;
    v5.ai_termid.at_type = 4;
    au_asid_t ai_asid = a1->ai_asid;
    v5.ai_termid.at_addr[0] = machine;
    v5.au_asid_t ai_asid = ai_asid;
    int result = setaudit_addr(&v5, 48);
    if (!result) {
      a1->au_asid_t ai_asid = v5.ai_asid;
    }
  }

  return result;
}

uint64_t kpersona_alloc( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v9 = 1LL;
  return __persona((void *)1, 0LL, a1, a2, &v9, 0LL, a7, a8);
}

uint64_t kpersona_palloc( void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v9 = 1LL;
  return __persona((void *)2, 0LL, a1, a2, &v9, a3, a7, a8);
}

uint64_t kpersona_dealloc( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  int v10 = a1;
  uint64_t v9 = 1LL;
  return __persona((void *)3, 0LL, 0LL, &v10, &v9, 0LL, a7, a8);
}

uint64_t kpersona_get( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v9 = 1LL;
  return __persona((void *)4, 0LL, 0LL, a1, &v9, 0LL, a7, a8);
}

uint64_t kpersona_getpath( int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  int v10 = a1;
  uint64_t v9 = 1LL;
  return __persona((void *)8, 0LL, 0LL, &v10, &v9, a2, a7, a8);
}

uint64_t kpersona_info(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  int v10 = a1;
  uint64_t v9 = 1LL;
  return __persona((void *)5, 0LL, a2, &v10, &v9, 0LL, a7, a8);
}

uint64_t kpersona_pidinfo( int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v10 = 1LL;
  int v9 = a1;
  return __persona((void *)6, 0LL, a2, &v9, &v10, 0LL, a7, a8);
}

uint64_t kpersona_find( uint64_t a1, int a2, void *a3, unsigned int *a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  v11[0] = 1;
  v11[1] = a2;
  v14[0] = 0;
  uint64_t v13 = 0LL;
  uint64_t v12 = 0LL;
  if (a1) {
    (*((void (**)(_BYTE *, uint64_t, uint64_t))_libkernel_string_functions + 11))(v14, a1, 256LL);
  }
  uint64_t result = __persona((void *)7, 0LL, v11, a3, a4, 0LL, a7, a8);
  if ((result & 0x80000000) == 0) {
    return *a4;
  }
  return result;
}

uint64_t kpersona_find_by_type( int a1, void *a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  unint64_t v10 = 0xFFFFFFFF00000001LL;
  int v11 = a1;
  int v12 = 0;
  uint64_t v13 = 0LL;
  char v14 = 0;
  uint64_t result = __persona((void *)9, 0LL, &v10, a2, a3, 0LL, a7, a8);
  if ((result & 0x80000000) == 0) {
    return *a3;
  }
  return result;
}

uint64_t guarded_open_np( void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8, unsigned int a9)
{
  else {
    unint64_t v9 = 0LL;
  }
  return __guarded_open_np(a1, a2, a3, a4, (void *)v9, a6, a7, a8);
}

uint64_t __carbon_delete(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t result = __delete(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!(_DWORD)result)
  {
    do
      unsigned int v9 = __ldaxr((unsigned int *)&__remove_counter);
    while (__stlxr(v9 + 1, (unsigned int *)&__remove_counter));
  }

  return result;
}

int munmap(void *a1, size_t a2)
{
  if (__syscall_logger) {
    __syscall_logger(32LL, mach_task_self_, a1, a2, 0LL, 0LL);
  }
  return __munmap(a1, a2);
}

kern_return_t clock_set_time(clock_ctrl_t clock_ctrl, mach_timespec_t new_time)
{
  kern_return_t v4;
  kern_return_t tv_sec;
  mach_msg_header_t v8;
  NDR_record_t v9;
  mach_timespec_t v10;
  unsigned int v9 = NDR_record;
  unint64_t v10 = new_time;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, clock_ctrl);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x4B000000000LL;
  auditinfo_addr v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, clock_ctrl),  (void *)0x4B000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  __darwin_time_t tv_sec = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return tv_sec;
    }

    if (v8.msgh_id == 71)
    {
      __darwin_time_t tv_sec = -308;
    }

    else if (v8.msgh_id == 1300)
    {
      __darwin_time_t tv_sec = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        __darwin_time_t tv_sec = v10.tv_sec;
        if (!v10.tv_sec) {
          return tv_sec;
        }
      }
    }

    else
    {
      __darwin_time_t tv_sec = -301;
    }

    mach_msg_destroy(&v8);
  }

  return tv_sec;
}

kern_return_t clock_set_attributes( clock_ctrl_t clock_ctrl, clock_flavor_t flavor, clock_attr_t clock_attr, mach_msg_type_number_t clock_attrCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  clock_flavor_t v13;
  mach_msg_type_number_t v14;
  int v15;
  int v12 = NDR_record;
  uint64_t v13 = flavor;
  if (clock_attrCnt > 1) {
    return -307;
  }
  uint64_t v7 = 4 * clock_attrCnt;
  memmove(&v15, clock_attr, 4 * clock_attrCnt);
  char v14 = clock_attrCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, clock_ctrl);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x4B100000000LL;
  unsigned int v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, clock_ctrl),  (void *)0x4B100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  auditinfo_addr v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      auditinfo_addr v4 = -308;
    }

    else if (v11.msgh_id == 1301)
    {
      auditinfo_addr v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        auditinfo_addr v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      auditinfo_addr v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t clock_alarm_reply( clock_reply_t alarm_port, mach_msg_type_name_t alarm_portPoly, kern_return_t alarm_code, alarm_type_t alarm_type, mach_timespec_t alarm_time)
{
  kern_return_t v9;
  alarm_type_t v10;
  mach_timespec_t v11;
  NDR_record_t v8 = NDR_record;
  unsigned int v9 = alarm_code;
  unint64_t v10 = alarm_type;
  int v11 = alarm_time;
  msg.mach_msg_bits_t msgh_bits = alarm_portPoly;
  msg.msgh_remote_port = alarm_port;
  msg.mach_port_name_t msgh_local_port = 0;
  msg.uint64_t msgh_voucher_port = 0;
  msg.uint64_t msgh_id = 3125107;
  return mach_msg_overwrite(&msg, 1, 0x30u, 0, 0, 0, 0, 0LL, v6);
}

kern_return_t clock_get_time(clock_serv_t clock_serv, mach_timespec_t *cur_time)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  mach_msg_header_t v10;
  kern_return_t v11;
  mach_timespec_t v12;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, clock_serv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x3E800000000LL;
  auditinfo_addr v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, clock_serv),  (void *)0x3E800000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  mach_msg_size_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_size_t v6 = -308;
    }

    else if (v10.msgh_id == 1100)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 44)
        {
          if (!v10.msgh_remote_port)
          {
            mach_msg_size_t v6 = v11;
            if (!v11)
            {
              *cur_time = v12;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            NDR_record_t v8 = 1;
          }
          else {
            NDR_record_t v8 = v11 == 0;
          }
          if (v8) {
            mach_msg_size_t v6 = -300;
          }
          else {
            mach_msg_size_t v6 = v11;
          }
          goto LABEL_23;
        }
      }

      mach_msg_size_t v6 = -300;
    }

    else
    {
      mach_msg_size_t v6 = -301;
    }

kern_return_t clock_get_attributes( clock_serv_t clock_serv, clock_flavor_t flavor, clock_attr_t clock_attr, mach_msg_type_number_t *clock_attrCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  mach_msg_header_t v16;
  NDR_record_t v17;
  clock_flavor_t v18;
  mach_msg_type_number_t v19;
  uint64_t v20;
  mach_vm_offset_t v17 = NDR_record;
  BOOL v7 = *clock_attrCnt != 0;
  BOOLean_t v18 = flavor;
  uint64_t v19 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v16.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v16.msgh_remote_port = __PAIR64__(reply_port, clock_serv);
  *(void *)&v16.uint64_t msgh_voucher_port = 0x3E900000000LL;
  unsigned int v9 = mach_msg2_internal( &v16,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, clock_serv),  (void *)0x3E900000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  unint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v10;
    }

    if (v16.msgh_id == 71)
    {
      unint64_t v10 = -308;
    }

    else if (v16.msgh_id == 1101)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size - 45 <= 0xFFFFFFFA)
        {
          if (v16.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v18 == 0;
          }
          if (!v12 && v16.msgh_size == 36) {
            unint64_t v10 = v18;
          }
          else {
            unint64_t v10 = -300;
          }
          goto LABEL_25;
        }

        if (!v16.msgh_remote_port)
        {
          unint64_t v10 = v18;
          if (v18) {
            goto LABEL_25;
          }
          vm_map_t v15 = v19;
          if (v19 <= 1 && v19 <= (v16.msgh_size - 40) >> 2 && v16.msgh_size == 4 * v19 + 40)
          {
            if (v19 <= *clock_attrCnt)
            {
              memmove(clock_attr, &v20, 4LL * v19);
              unint64_t v10 = 0;
              *clock_attrCnt = v15;
            }

            else
            {
              *clock_attrCnt = v19;
              return -307;
            }

            return v10;
          }
        }
      }

      unint64_t v10 = -300;
    }

    else
    {
      unint64_t v10 = -301;
    }

kern_return_t clock_alarm( clock_serv_t clock_serv, alarm_type_t alarm_type, mach_timespec_t alarm_time, clock_reply_t alarm_port)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  int v11;
  clock_reply_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  alarm_type_t v16;
  mach_timespec_t v17;
  int v11 = 1;
  int v12 = alarm_port;
  char v14 = 1376256;
  vm_map_t v15 = NDR_record;
  uint64_t v16 = alarm_type;
  mach_vm_offset_t v17 = alarm_time;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, clock_serv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x3EA00000000LL;
  mach_msg_size_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, clock_serv),  (void *)0x3EA00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  BOOL v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      BOOL v7 = -308;
    }

    else if (v10.msgh_id == 1102)
    {
      BOOL v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        BOOL v7 = v13;
        if (!v13) {
          return v7;
        }
      }
    }

    else
    {
      BOOL v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t exception_raise( mach_port_t exception_port, mach_port_t thread, mach_port_t task, exception_type_t exception, exception_data_t code, mach_msg_type_number_t codeCnt)
{
  kern_return_t v6;
  mach_msg_type_number_t v9;
  uint64_t reply_port;
  kern_return_t v11;
  mach_msg_header_t v13;
  int v14;
  mach_port_t v15;
  kern_return_t v16;
  int v17;
  mach_port_t v18;
  int v19;
  NDR_record_t v20;
  exception_type_t v21;
  mach_msg_type_number_t v22;
  uint64_t v23;
  char v14 = 2;
  vm_map_t v15 = thread;
  mach_vm_offset_t v17 = 1245184;
  BOOLean_t v18 = task;
  uint64_t v19 = 1245184;
  uint64_t v20 = NDR_record;
  memory_object_offset_t v21 = exception;
  if (codeCnt > 2) {
    return -307;
  }
  unsigned int v9 = 4 * codeCnt;
  memmove(&v23, code, 4 * codeCnt);
  sigset_t v22 = codeCnt;
  uint64_t reply_port = mig_get_reply_port();
  v13.mach_msg_bits_t msgh_bits = -2147478253;
  v13.msgh_size = v9 + 68;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, exception_port);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x96100000000LL;
  int v11 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)(((unint64_t)((v9 + 68) >> 2) << 34) | 0x80001513),  (void *)__PAIR64__(reply_port, exception_port),  (void *)0x96100000000LL,  (void *)((reply_port << 32) | 2),  (void *)0x2C,  0LL);
  mach_msg_size_t v6 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v6;
    }

    if (v13.msgh_id == 71)
    {
      mach_msg_size_t v6 = -308;
    }

    else if (v13.msgh_id == 2501)
    {
      mach_msg_size_t v6 = -300;
      if ((v13.msgh_bits & 0x80000000) == 0 && v13.msgh_size == 36 && !v13.msgh_remote_port)
      {
        mach_msg_size_t v6 = v16;
        if (!v16) {
          return v6;
        }
      }
    }

    else
    {
      mach_msg_size_t v6 = -301;
    }

    mach_msg_destroy(&v13);
  }

  return v6;
}

kern_return_t exception_raise_state( mach_port_t exception_port, exception_type_t exception, const exception_data_t code, mach_msg_type_number_t codeCnt, int *flavor, const thread_state_t old_state, mach_msg_type_number_t old_stateCnt, thread_state_t new_state, mach_msg_type_number_t *new_stateCnt)
{
  kern_return_t v17;
  char *v19;
  uint64_t reply_port;
  kern_return_t v21;
  BOOL v22;
  mach_msg_type_number_t v24;
  size_t v25;
  mach_msg_header_t v26;
  NDR_record_t v27;
  exception_type_t v28;
  mach_msg_type_number_t v29;
  mach_msg_size_t v30;
  int v31;
  unint64_t v27 = NDR_record;
  unint64_t v28 = exception;
  if (codeCnt > 2) {
    return -307;
  }
  size_t v15 = 4 * codeCnt;
  memmove(&v30, code, v15);
  unint64_t v29 = codeCnt;
  uint64_t v16 = (char *)&v26 + v15;
  *(_DWORD *)((char *)&v26 + v15 + 40) = *flavor;
  if (old_stateCnt > 0x510) {
    return -307;
  }
  uint64_t v19 = v16 - 8;
  memmove(v16 + 48, old_state, 4 * old_stateCnt);
  *((_DWORD *)v19 + 13) = old_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v26.mach_msg_bits_t msgh_bits = 5395;
  v26.msgh_size = v15 + 4 * old_stateCnt + 48;
  *(void *)&v26.msgh_remote_port = __PAIR64__(reply_port, exception_port);
  *(void *)&v26.uint64_t msgh_voucher_port = 0x96200000000LL;
  memory_object_offset_t v21 = mach_msg2_internal( &v26,  0x200000003uLL,  (void *)(((unint64_t)v26.msgh_size << 32) | 0x1513),  (void *)__PAIR64__(reply_port, exception_port),  (void *)0x96200000000LL,  (void *)(reply_port << 32),  (void *)0x1474,  0LL);
  mach_vm_offset_t v17 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (v21)
    {
      mig_dealloc_reply_port(v26.msgh_local_port);
      return v17;
    }

    if (v26.msgh_id == 71)
    {
      mach_vm_offset_t v17 = -308;
    }

    else if (v26.msgh_id == 2502)
    {
      if ((v26.msgh_bits & 0x80000000) == 0)
      {
        if (v26.msgh_size - 5229 <= 0xFFFFEBBE)
        {
          if (v26.msgh_remote_port) {
            sigset_t v22 = 1;
          }
          else {
            sigset_t v22 = v28 == 0;
          }
          if (!v22 && v26.msgh_size == 36) {
            mach_vm_offset_t v17 = v28;
          }
          else {
            mach_vm_offset_t v17 = -300;
          }
          goto LABEL_26;
        }

        if (!v26.msgh_remote_port)
        {
          mach_vm_offset_t v17 = v28;
          if (v28) {
            goto LABEL_26;
          }
          int v24 = v30;
          if (v30 <= 0x510 && v30 <= (v26.msgh_size - 44) >> 2)
          {
            uint64_t v25 = 4LL * v30;
            if (v26.msgh_size == 4 * v30 + 44)
            {
              *flavor = v29;
              memmove(new_state, &v31, v25);
              mach_vm_offset_t v17 = 0;
              *new_stateCnt = v24;
              return v17;
            }
          }
        }
      }

      mach_vm_offset_t v17 = -300;
    }

    else
    {
      mach_vm_offset_t v17 = -301;
    }

LABEL_26:
    mach_msg_destroy(&v26);
  }

  return v17;
}

    mach_msg_destroy(&v26);
  }

  return v17;
}

    mach_msg_destroy(&v21);
  }

  return v7;
}

    mach_msg_destroy(&v23);
  }

  return v7;
}

kern_return_t exception_raise_state_identity( mach_port_t exception_port, mach_port_t thread, mach_port_t task, exception_type_t exception, exception_data_t code, mach_msg_type_number_t codeCnt, int *flavor, thread_state_t old_state, mach_msg_type_number_t old_stateCnt, thread_state_t new_state, mach_msg_type_number_t *new_stateCnt)
{
  kern_return_t v17;
  char *v19;
  uint64_t reply_port;
  kern_return_t v21;
  BOOL v22;
  mach_msg_type_number_t v24;
  size_t v25;
  mach_msg_header_t v26;
  unsigned int v27;
  mach_port_t v28;
  kern_return_t v29;
  int v30;
  mach_port_t v31;
  _DWORD v32[2];
  NDR_record_t v33;
  exception_type_t v34;
  mach_msg_type_number_t v35;
  uint64_t v36;
  unint64_t v27 = 2;
  unint64_t v28 = thread;
  int v30 = 1245184;
  uint64_t v31 = task;
  v32[1] = 1245184;
  uint64_t v33 = NDR_record;
  __int16 v34 = exception;
  if (codeCnt > 2) {
    return -307;
  }
  size_t v15 = 4 * codeCnt;
  memmove(&v36, code, v15);
  BOOL v35 = codeCnt;
  uint64_t v16 = (char *)&v26 + v15;
  *(_DWORD *)((char *)&v26 + v15 + 68) = *flavor;
  if (old_stateCnt > 0x510) {
    return -307;
  }
  uint64_t v19 = v16 - 8;
  memmove(v16 + 76, old_state, 4 * old_stateCnt);
  *((_DWORD *)v19 + 20) = old_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v26.mach_msg_bits_t msgh_bits = -2147478253;
  v26.msgh_size = v15 + 4 * old_stateCnt + 76;
  *(void *)&v26.msgh_remote_port = __PAIR64__(reply_port, exception_port);
  *(void *)&v26.uint64_t msgh_voucher_port = 0x96300000000LL;
  memory_object_offset_t v21 = mach_msg2_internal( &v26,  0x200000003uLL,  (void *)(((unint64_t)v26.msgh_size << 32) | 0x80001513),  (void *)__PAIR64__(reply_port, exception_port),  (void *)0x96300000000LL,  (void *)(v27 | (unint64_t)(reply_port << 32)),  (void *)0x1474,  0LL);
  mach_vm_offset_t v17 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (v21)
    {
      mig_dealloc_reply_port(v26.msgh_local_port);
      return v17;
    }

    if (v26.msgh_id == 71)
    {
      mach_vm_offset_t v17 = -308;
    }

    else if (v26.msgh_id == 2503)
    {
      if ((v26.msgh_bits & 0x80000000) == 0)
      {
        if (v26.msgh_size - 5229 <= 0xFFFFEBBE)
        {
          if (v26.msgh_remote_port) {
            sigset_t v22 = 1;
          }
          else {
            sigset_t v22 = v29 == 0;
          }
          if (!v22 && v26.msgh_size == 36) {
            mach_vm_offset_t v17 = v29;
          }
          else {
            mach_vm_offset_t v17 = -300;
          }
          goto LABEL_26;
        }

        if (!v26.msgh_remote_port)
        {
          mach_vm_offset_t v17 = v29;
          if (v29) {
            goto LABEL_26;
          }
          int v24 = v31;
          if (v31 <= 0x510 && v31 <= (v26.msgh_size - 44) >> 2)
          {
            uint64_t v25 = 4LL * v31;
            if (v26.msgh_size == 4 * v31 + 44)
            {
              *flavor = v30;
              memmove(new_state, v32, v25);
              mach_vm_offset_t v17 = 0;
              *new_stateCnt = v24;
              return v17;
            }
          }
        }
      }

      mach_vm_offset_t v17 = -300;
    }

    else
    {
      mach_vm_offset_t v17 = -301;
    }

uint64_t (*exc_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t _Xexception_raise(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0)
  {
    int v5 = *(_DWORD *)(a1 + 24);
    uint64_t result = 4294966992LL;
    if (v5 == 2)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 4);
      if (v6 >= 0x44 && v6 <= 0x4C)
      {
        if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112 && *(unsigned __int16 *)(a1 + 50) << 16 == 1114112)
        {
          uint64_t v7 = *(unsigned int *)(a1 + 64);
          if (v7 <= 2 && v7 <= (v6 - 68) >> 2 && v6 == 4 * (_DWORD)v7 + 68) {
            uint64_t result = internal_catch_exception_raise( *(unsigned int *)(a1 + 12),  *(unsigned int *)(a1 + 28),  *(unsigned int *)(a1 + 40),  *(unsigned int *)(a1 + 60),  a1 + 68,  v7);
          }
        }

        else
        {
          uint64_t result = 4294966996LL;
        }
      }
    }
  }

  else
  {
    uint64_t result = 4294966992LL;
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *_Xexception_raise_state(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  unsigned int v3 = result[1];
  BOOL v4 = v3 < 0x30 || v3 > 0x1478;
  if (v4
    || (uint64_t v5 = result[9], v5 > 2)
    || ((unsigned int v6 = v5, v5 <= (v3 - 48) >> 2) ? (v7 = v3 >= 4 * (int)v5 + 48) : (v7 = 0),
        !v7
     || (NDR_record_t v8 = (char *)&result[v6], v9 = *((unsigned int *)v8 + 11), v9 > 0x510)
     || ((unsigned int v10 = v3 - v6 * 4, v9 <= (v10 - 48) >> 2) ? (v11 = v10 == 4 * (_DWORD)v9 + 48) : (v11 = 0), !v11)))
  {
LABEL_17:
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v12 = NDR_record;
LABEL_18:
    *(NDR_record_t *)(a2 + 24) = v12;
    return result;
  }

  uint64_t v13 = v8 - 8;
  *(_DWORD *)(a2 + 40) = 1296;
  char v14 = v13 + 48;
  uint64_t result = (_DWORD *)internal_catch_exception_raise_state( result[3],  result[8],  (uint64_t)(result + 10),  v5,  (uint64_t)(v13 + 48),  (uint64_t)(v13 + 56),  v9,  a2 + 44,  a2 + 40);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v12 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_18;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 36) = *v14;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t _Xexception_raise_state_identity(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 4);
  if (v5 < 0x4C || v5 > 0x1494) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }

  uint64_t v7 = *(unsigned int *)(result + 64);
  int v3 = -304;
  unsigned int v8 = 4 * v7;
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (unsigned int v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_4:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }

  *(_DWORD *)(a2 + 40) = 1296;
  NDR_record_t v12 = (_DWORD *)(v9 + 68);
  LODWORD(v13) = v10;
  uint64_t result = internal_catch_exception_raise_state_identity( *(unsigned int *)(result + 12),  *(unsigned int *)(result + 28),  *(unsigned int *)(result + 40),  *(unsigned int *)(result + 60),  result + 68,  v7,  v9 + 68,  v9 + 76,  v13,  a2 + 44,  a2 + 40);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if ((_DWORD)result) {
    goto LABEL_4;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 36) = *v12;
  *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
  return result;
}

uint64_t exc_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2404) >= 0xFFFFFFFD
    && (unsigned int v5 = (void (*)(void))internal_catch_exc_subsystem[5 * (v4 - 2401) + 5]) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

kern_return_t host_get_boot_info(host_priv_t host_priv, kernel_boot_info_t boot_info)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  uint64_t v11;
  int v12;
  mach_msg_header_t v13;
  kern_return_t v14;
  mach_msg_size_t v15;
  _BYTE v16[4108];
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x19000000000LL;
  unsigned int v5 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19000000000LL,  (void *)(reply_port << 32),  (void *)0x1034,  0LL);
  unsigned int v6 = v5;
  if (v5)
  {
    mig_dealloc_reply_port(v13.msgh_local_port);
    return v6;
  }

  if (v13.msgh_id == 71)
  {
    unsigned int v6 = -308;
LABEL_25:
    mach_msg_destroy(&v13);
    return v6;
  }

  if (v13.msgh_id != 500)
  {
    unsigned int v6 = -301;
    goto LABEL_25;
  }

  if ((v13.msgh_bits & 0x80000000) != 0) {
    goto LABEL_24;
  }
  if (v13.msgh_size - 4141 <= 0xFFFFEFFE)
  {
    if (v13.msgh_remote_port) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = v14 == 0;
    }
    if (!v8 && v13.msgh_size == 36) {
      unsigned int v6 = v14;
    }
    else {
      unsigned int v6 = -300;
    }
    goto LABEL_25;
  }

  if (v13.msgh_remote_port)
  {
LABEL_24:
    unsigned int v6 = -300;
    goto LABEL_25;
  }

  unsigned int v6 = v14;
  if (v14) {
    goto LABEL_25;
  }
  unsigned int v6 = -300;
  if (v15 > 0x1000 || v13.msgh_size - 44 < v15 || v13.msgh_size != ((v15 + 3) & 0xFFFFFFFC) + 44) {
    goto LABEL_25;
  }
  unsigned int v11 = 0LL;
  while (1)
  {
    NDR_record_t v12 = v16[v11];
    boot_info[v11] = v12;
    if (!v12) {
      break;
    }
    if ((_DWORD)++v11 == 4095)
    {
      unsigned int v6 = 0;
      boot_info[v11] = 0;
      return v6;
    }
  }

  return 0;
}

kern_return_t host_reboot(host_priv_t host_priv, int options)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  int v10;
  uint64_t v9 = NDR_record;
  unsigned int v10 = options;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x19100000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  unsigned int v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      unsigned int v5 = -308;
    }

    else if (v8.msgh_id == 501)
    {
      unsigned int v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        unsigned int v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      unsigned int v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t host_priv_statistics( host_priv_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  host_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[280];
  BOOLean_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *host_info_outCnt;
  if (*host_info_outCnt >= 0x44) {
    mach_msg_type_number_t v7 = 68;
  }
  uint64_t v19 = flavor;
  uint64_t v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v17.uint64_t msgh_voucher_port = 0x19200000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19200000000LL,  (void *)(reply_port << 32),  (void *)0x140,  0LL);
  unsigned int v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      unsigned int v10 = -308;
    }

    else if (v17.msgh_id == 502)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 313 <= 0xFFFFFEEE)
        {
          if (v17.msgh_remote_port) {
            NDR_record_t v12 = 1;
          }
          else {
            NDR_record_t v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            unsigned int v10 = v19;
          }
          else {
            unsigned int v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          unsigned int v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          size_t v15 = v20;
          if (v20 <= 0x44 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            uint64_t v16 = *host_info_outCnt;
            if (v20 <= v16)
            {
              memmove(host_info_out, v21, 4LL * v20);
              unsigned int v10 = 0;
              *host_info_outCnt = v15;
            }

            else
            {
              memmove(host_info_out, v21, 4 * v16);
              *host_info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      unsigned int v10 = -300;
    }

    else
    {
      unsigned int v10 = -301;
    }

LABEL_27:
    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v27);
  }

  return v15;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v18);
  }

  return v11;
}

    mach_msg_destroy(&v18);
  }

  return v11;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v27);
  }

  return v15;
}

    mach_msg_destroy(&v21);
  }

  return v12;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v27);
  }

  return v15;
}

    mach_msg_destroy(&v21);
  }

  return v12;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

    mach_msg_destroy(&v16);
  }

  return v9;
}

    mach_msg_destroy(&v17);
  }

  return v10;
}

kern_return_t host_default_memory_manager( host_priv_t host_priv, memory_object_default_t *default_manager, memory_object_cluster_size_t cluster_size)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  int v12;
  memory_object_default_t v13;
  kern_return_t v14;
  int v15;
  NDR_record_t v16;
  memory_object_cluster_size_t v17;
  memory_object_default_t v5 = *default_manager;
  NDR_record_t v12 = 1;
  uint64_t v13 = v5;
  size_t v15 = 1310720;
  uint64_t v16 = NDR_record;
  mach_vm_offset_t v17 = cluster_size;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x19300000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19300000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  unsigned int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        unsigned int v8 = -308;
      }

      else if (v11.msgh_id == 503)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          unsigned int v8 = -300;
          if (v12 == 1 && v11.msgh_size == 40 && !v11.msgh_remote_port && HIWORD(v15) << 16 == 1114112)
          {
            unsigned int v8 = 0;
            *default_manager = v13;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          unsigned int v8 = -300;
          if (v14)
          {
            if (v11.msgh_remote_port) {
              unsigned int v8 = -300;
            }
            else {
              unsigned int v8 = v14;
            }
          }
        }

        else
        {
          unsigned int v8 = -300;
        }
      }

      else
      {
        unsigned int v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t vm_wire( host_priv_t host_priv, vm_map_t task, vm_address_t address, vm_size_t size, vm_prot_t desired_access)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  int v11;
  vm_map_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  vm_address_t v16;
  vm_size_t v17;
  vm_prot_t v18;
  unsigned int v11 = 1;
  NDR_record_t v12 = task;
  char v14 = 1245184;
  size_t v15 = NDR_record;
  uint64_t v16 = address;
  mach_vm_offset_t v17 = size;
  BOOLean_t v18 = desired_access;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x4480001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x19400000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x4480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19400000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  unsigned int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      unsigned int v8 = -308;
    }

    else if (v10.msgh_id == 504)
    {
      unsigned int v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        unsigned int v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      unsigned int v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t thread_wire(host_priv_t host_priv, thread_act_t thread, BOOLean_t wired)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  thread_act_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  BOOLean_t v15;
  unsigned int v10 = 1;
  unsigned int v11 = thread;
  uint64_t v13 = 1245184;
  char v14 = NDR_record;
  size_t v15 = wired;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x19500000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  unsigned int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      unsigned int v6 = -308;
    }

    else if (v9.msgh_id == 505)
    {
      unsigned int v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        unsigned int v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      unsigned int v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t vm_allocate_cpm( host_priv_t host_priv, vm_map_t task, vm_address_t *address, vm_size_t size, int flags)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  vm_map_t v15;
  kern_return_t v16;
  _DWORD v17[9];
  char v14 = 1;
  size_t v15 = task;
  v17[0] = 1245184;
  vm_address_t v7 = *address;
  *(NDR_record_t *)&v17[1] = NDR_record;
  *(void *)&v17[3] = v7;
  *(void *)&v17[5] = size;
  v17[7] = flags;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x4480001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x19600000000LL;
  uint64_t v9 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x4480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19600000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x34,  0LL);
  unsigned int v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v13.msgh_id == 71)
      {
        unsigned int v10 = -308;
      }

      else if (v13.msgh_id == 506)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 44)
          {
            if (!v13.msgh_remote_port)
            {
              unsigned int v10 = v16;
              if (!v16)
              {
                *mach_vm_address_t address = *(void *)v17;
                return v10;
              }

              goto LABEL_20;
            }
          }

          else if (v13.msgh_size == 36)
          {
            if (v13.msgh_remote_port) {
              unsigned int v11 = 1;
            }
            else {
              unsigned int v11 = v16 == 0;
            }
            if (v11) {
              unsigned int v10 = -300;
            }
            else {
              unsigned int v10 = v16;
            }
            goto LABEL_20;
          }
        }

        unsigned int v10 = -300;
      }

      else
      {
        unsigned int v10 = -301;
      }

kern_return_t host_processors( host_priv_t host_priv, processor_array_t *out_processor_list, mach_msg_type_number_t *out_processor_listCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  processor_t *v14;
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x19700000000LL;
  vm_address_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19700000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  unsigned int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        unsigned int v8 = -308;
      }

      else if (v12.msgh_id == 507)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          unsigned int v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 529)
          {
            unsigned int v10 = v16;
            if (v16 == v17)
            {
              unsigned int v8 = 0;
              *out_processor_list = v14;
              *out_processor_listCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          unsigned int v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              unsigned int v8 = -300;
            }
            else {
              unsigned int v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          unsigned int v8 = -300;
        }
      }

      else
      {
        unsigned int v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t host_get_clock_control(host_priv_t host_priv, clock_id_t clock_id, clock_ctrl_t *clock_ctrl)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  clock_id_t v12;
  unsigned __int16 v13;
  unsigned int v11 = NDR_record;
  NDR_record_t v12 = clock_id;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x19800000000LL;
  unsigned int v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19800000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  vm_address_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        vm_address_t v7 = -308;
      }

      else if (v10.msgh_id == 508)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          vm_address_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            vm_address_t v7 = 0;
            *clock_ctrl = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          vm_address_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              vm_address_t v7 = -300;
            }
            else {
              vm_address_t v7 = v12;
            }
          }
        }

        else
        {
          vm_address_t v7 = -300;
        }
      }

      else
      {
        vm_address_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t kmod_create(host_priv_t host_priv, vm_address_t info, kmod_t *module)
{
  kern_return_t v6;
  kern_return_t v7;
  BOOL v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  vm_address_t v13;
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = info;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x19900000000LL;
  unsigned int v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19900000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  vm_address_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      vm_address_t v7 = -308;
    }

    else if (v11.msgh_id == 509)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            vm_address_t v7 = v13;
            if (!(_DWORD)v13)
            {
              *module = HIDWORD(v13);
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = (_DWORD)v13 == 0;
          }
          if (v9) {
            vm_address_t v7 = -300;
          }
          else {
            vm_address_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      vm_address_t v7 = -300;
    }

    else
    {
      vm_address_t v7 = -301;
    }

kern_return_t kmod_destroy(host_priv_t host_priv, kmod_t module)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  kmod_t v10;
  uint64_t v9 = NDR_record;
  unsigned int v10 = module;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x19A00000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19A00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  memory_object_default_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      memory_object_default_t v5 = -308;
    }

    else if (v8.msgh_id == 510)
    {
      memory_object_default_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        memory_object_default_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      memory_object_default_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t kmod_control( host_priv_t host_priv, kmod_t module, kmod_control_flavor_t flavor, kmod_args_t *data, mach_msg_type_number_t *dataCnt)
{
  kern_return_t v10;
  kern_return_t v11;
  mach_msg_type_number_t v12;
  mach_msg_header_t v14;
  int v15;
  kmod_args_t v16;
  int v17;
  mach_msg_type_number_t v18;
  NDR_record_t v19;
  kmod_t v20;
  kmod_control_flavor_t v21;
  mach_msg_type_number_t v22;
  size_t v15 = 1;
  uint64_t v16 = *data;
  mach_msg_type_number_t v8 = *dataCnt;
  mach_vm_offset_t v17 = 16777472;
  BOOLean_t v18 = v8;
  uint64_t v19 = NDR_record;
  uint64_t v20 = module;
  memory_object_offset_t v21 = flavor;
  sigset_t v22 = v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x19B00000000LL;
  unsigned int v10 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19B00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x40,  0LL);
  unsigned int v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (v14.msgh_id == 71)
      {
        unsigned int v11 = -308;
      }

      else if (v14.msgh_id == 511)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            unsigned int v11 = -300;
            if (HIDWORD(v16))
            {
              if (v14.msgh_remote_port) {
                unsigned int v11 = -300;
              }
              else {
                unsigned int v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            unsigned int v11 = -300;
          }

          goto LABEL_21;
        }

        unsigned int v11 = -300;
        if (v15 == 1 && *(void *)&v14.msgh_size == 56LL && HIBYTE(v17) == 1)
        {
          NDR_record_t v12 = v18;
          if (v18 == v20)
          {
            unsigned int v11 = 0;
            *data = v16;
            *dataCnt = v12;
            return v11;
          }
        }
      }

      else
      {
        unsigned int v11 = -301;
      }

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  NDR_record_t v12;
  int v13;
  int v14;
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = node;
  char v14 = which;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x19C00000000LL;
  vm_address_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19C00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v11.msgh_id == 512)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (*(_DWORD *)&v12.mig_vers == 1 && *(void *)&v11.msgh_size == 40LL && HIWORD(v14) << 16 == 1114112)
          {
            mach_msg_type_number_t v8 = 0;
            *port = *(_DWORD *)&v12.int_rep;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13)
          {
            if (v11.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = v13;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t host_set_special_port(host_priv_t host_priv, int which, mach_port_t port)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  mach_port_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  int v15;
  unsigned int v10 = 1;
  unsigned int v11 = port;
  uint64_t v13 = 1245184;
  char v14 = NDR_record;
  size_t v15 = which;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x19D00000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19D00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  unsigned int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      unsigned int v6 = -308;
    }

    else if (v9.msgh_id == 513)
    {
      unsigned int v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        unsigned int v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      unsigned int v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t host_set_exception_ports( host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  int v11;
  mach_port_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  exception_mask_t v16;
  exception_behavior_t v17;
  thread_state_flavor_t v18;
  unsigned int v11 = 1;
  NDR_record_t v12 = new_port;
  char v14 = 1245184;
  size_t v15 = NDR_record;
  uint64_t v16 = exception_mask;
  mach_vm_offset_t v17 = behavior;
  BOOLean_t v18 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x19E00000000LL;
  vm_address_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19E00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_type_number_t v8 = -308;
    }

    else if (v10.msgh_id == 514)
    {
      mach_msg_type_number_t v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        mach_msg_type_number_t v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      mach_msg_type_number_t v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t host_get_exception_ports( host_priv_t host_priv, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v14;
  kern_return_t v15;
  unsigned __int8 *p_int_rep;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  NDR_record_t v28;
  exception_mask_t v29;
  mach_msg_size_t v30;
  uint64_t v31;
  unint64_t v28 = NDR_record;
  unint64_t v29 = exception_mask;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v27.uint64_t msgh_voucher_port = 0x19F00000000LL;
  char v14 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x19F00000000LL,  (void *)(reply_port << 32),  (void *)0x330,  0LL);
  size_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v27.msgh_local_port);
      return v15;
    }

    if (v27.msgh_id == 71)
    {
      size_t v15 = -308;
    }

    else if (v27.msgh_id == 515)
    {
      if ((v27.msgh_bits & 0x80000000) != 0)
      {
        size_t v15 = -300;
        if (*(_DWORD *)&v28.mig_vers != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
          goto LABEL_27;
        }
        p_int_rep = &v28.int_rep;
        BOOLean_t v18 = 36LL;
        while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
        {
          v18 += 12LL;
          if ((_DWORD)v18 == 420)
          {
            uint64_t v19 = v30;
            if (v30 > 0x20) {
              break;
            }
            size_t v15 = -300;
            if (v30 <= (v27.msgh_size - 424) >> 2)
            {
              memory_object_offset_t v21 = 4 * v30;
              sigset_t v22 = v21 + 424;
              if (v27.msgh_size >= (v21 + 424))
              {
                int32x2_t v23 = v27.msgh_size - v21;
                if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v30)
                {
                  int v24 = v23 - v21;
                  if (v24 == v22 && (v24 - 424) >> 2 >= v30)
                  {
                    uint64_t v25 = (char *)&v27 + v21 - 128;
                    memmove(masks, &v31, 4 * v30);
                    *masksCnt = v19;
                    if ((_DWORD)v19)
                    {
                      do
                      {
                        int v26 = *(_DWORD *)p_int_rep;
                        p_int_rep += 12;
                        *old_handlers++ = v26;
                        --v19;
                      }

                      while (v19);
                    }

                    memmove(old_behaviors, v25 + 552, v21);
                    memmove(old_flavors, &v25[v21 + 552], v21);
                    return 0;
                  }
                }
              }
            }

            goto LABEL_27;
          }
        }
      }

      else if (v27.msgh_size == 36)
      {
        size_t v15 = -300;
        if (v29)
        {
          if (v27.msgh_remote_port) {
            size_t v15 = -300;
          }
          else {
            size_t v15 = v29;
          }
        }

        goto LABEL_27;
      }

      size_t v15 = -300;
    }

    else
    {
      size_t v15 = -301;
    }

kern_return_t host_swap_exception_ports( host_priv_t host_priv, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlerss, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v15;
  kern_return_t v16;
  exception_handler_t *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  int v28;
  mach_port_t v29;
  kern_return_t v30;
  int v31;
  NDR_record_t v32;
  exception_mask_t v33;
  exception_behavior_t v34;
  thread_state_flavor_t v35;
  mach_msg_size_t v36;
  uint64_t v37;
  unint64_t v28 = 1;
  unint64_t v29 = new_port;
  uint64_t v31 = 1245184;
  uint64_t v32 = NDR_record;
  uint64_t v33 = exception_mask;
  __int16 v34 = behavior;
  BOOL v35 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v27.uint64_t msgh_voucher_port = 0x1A000000000LL;
  size_t v15 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x1A000000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x330,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (v27.msgh_id == 71)
      {
        uint64_t v16 = -308;
      }

      else if (v27.msgh_id == 516)
      {
        if ((v27.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v16 = -300;
          if (v28 != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
            goto LABEL_24;
          }
          mach_vm_offset_t v17 = &v29;
          BOOLean_t v18 = 36LL;
          while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
          {
            v18 += 12LL;
            if ((_DWORD)v18 == 420)
            {
              uint64_t v19 = v36;
              if (v36 > 0x20) {
                break;
              }
              uint64_t v16 = -300;
              if (v36 <= (v27.msgh_size - 424) >> 2)
              {
                memory_object_offset_t v21 = 4 * v36;
                sigset_t v22 = v21 + 424;
                if (v27.msgh_size >= (v21 + 424))
                {
                  int32x2_t v23 = v27.msgh_size - v21;
                  if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v36)
                  {
                    int v24 = v23 - v21;
                    if (v24 == v22 && (v24 - 424) >> 2 >= v36)
                    {
                      uint64_t v25 = (char *)&v27 + v21 - 128;
                      memmove(masks, &v37, 4 * v36);
                      *masksCnt = v19;
                      if ((_DWORD)v19)
                      {
                        do
                        {
                          int v26 = *v17;
                          v17 += 3;
                          *old_handlerss++ = v26;
                          --v19;
                        }

                        while (v19);
                      }

                      memmove(old_behaviors, v25 + 552, v21);
                      memmove(old_flavors, &v25[v21 + 552], v21);
                      return 0;
                    }
                  }
                }
              }

              goto LABEL_24;
            }
          }
        }

        else if (v27.msgh_size == 36)
        {
          uint64_t v16 = -300;
          if (v30)
          {
            if (v27.msgh_remote_port) {
              uint64_t v16 = -300;
            }
            else {
              uint64_t v16 = v30;
            }
          }

          goto LABEL_24;
        }

        uint64_t v16 = -300;
      }

      else
      {
        uint64_t v16 = -301;
      }

LABEL_24:
      mach_msg_destroy(&v27);
      return v16;
    }

    mig_dealloc_reply_port(v27.msgh_local_port);
  }

  return v16;
}

      mach_msg_destroy(&v20);
      return v16;
    }

    mig_dealloc_reply_port(v20.msgh_local_port);
  }

  return v16;
}

    mach_msg_destroy(&v23);
  }

  return v16;
}

      mach_msg_destroy(&v27);
      return v16;
    }

    mig_dealloc_reply_port(v27.msgh_local_port);
  }

  return v16;
}

      mach_msg_destroy(&v27);
      return v16;
    }

    mig_dealloc_reply_port(v27.msgh_local_port);
  }

  return v16;
}

    mach_msg_destroy(&v23);
  }

  return v16;
}

kern_return_t mach_vm_wire( host_priv_t host_priv, vm_map_t task, mach_vm_address_t address, mach_vm_size_t size, vm_prot_t desired_access)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  int v11;
  vm_map_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  mach_vm_address_t v16;
  mach_vm_size_t v17;
  vm_prot_t v18;
  unsigned int v11 = 1;
  NDR_record_t v12 = task;
  char v14 = 1245184;
  size_t v15 = NDR_record;
  uint64_t v16 = address;
  mach_vm_offset_t v17 = size;
  BOOLean_t v18 = desired_access;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x4480001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x1A200000000LL;
  vm_address_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x4480001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x1A200000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_type_number_t v8 = -308;
    }

    else if (v10.msgh_id == 518)
    {
      mach_msg_type_number_t v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        mach_msg_type_number_t v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      mach_msg_type_number_t v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t host_processor_sets( host_priv_t host_priv, processor_set_name_array_t *processor_sets, mach_msg_type_number_t *processor_setsCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  processor_set_t *v14;
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x1A300000000LL;
  vm_address_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x1A300000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v12.msgh_id == 519)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 529)
          {
            unsigned int v10 = v16;
            if (v16 == v17)
            {
              mach_msg_type_number_t v8 = 0;
              *processor_sets = v14;
              *processor_setsCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t host_processor_set_priv( host_priv_t host_priv, processor_set_name_t set_name, processor_set_t *set)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  int v11;
  processor_set_t v12;
  kern_return_t v13;
  int v14;
  unsigned int v11 = 1;
  NDR_record_t v12 = set_name;
  char v14 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x1A400000000LL;
  unsigned int v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x1A400000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  vm_address_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        vm_address_t v7 = -308;
      }

      else if (v10.msgh_id == 520)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          vm_address_t v7 = -300;
          if (v11 == 1 && *(void *)&v10.msgh_size == 40LL && HIWORD(v14) << 16 == 1114112)
          {
            vm_address_t v7 = 0;
            *set = v12;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          vm_address_t v7 = -300;
          if (v13)
          {
            if (v10.msgh_remote_port) {
              vm_address_t v7 = -300;
            }
            else {
              vm_address_t v7 = v13;
            }
          }
        }

        else
        {
          vm_address_t v7 = -300;
        }
      }

      else
      {
        vm_address_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t host_set_UNDServer(host_priv_t host, UNDServerRef server)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  UNDServerRef v10;
  kern_return_t v11;
  int v12;
  uint64_t v9 = 1;
  unsigned int v10 = server;
  NDR_record_t v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x1A700000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0x1A700000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  memory_object_default_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      memory_object_default_t v5 = -308;
    }

    else if (v8.msgh_id == 523)
    {
      memory_object_default_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        memory_object_default_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      memory_object_default_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t host_get_UNDServer(host_priv_t host, UNDServerRef *server)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  UNDServerRef v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x1A800000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0x1A800000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  unsigned int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        unsigned int v6 = -308;
      }

      else if (v9.msgh_id == 524)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          unsigned int v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            unsigned int v6 = 0;
            *server = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          unsigned int v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              unsigned int v6 = -300;
            }
            else {
              unsigned int v6 = v12;
            }
          }
        }

        else
        {
          unsigned int v6 = -300;
        }
      }

      else
      {
        unsigned int v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t kext_request( host_priv_t host_priv, uint32_t user_log_flags, vm_offset_t request_data, mach_msg_type_number_t request_dataCnt, vm_offset_t *response_data, mach_msg_type_number_t *response_dataCnt, vm_offset_t *log_data, mach_msg_type_number_t *log_dataCnt, kern_return_t *op_result)
{
  kern_return_t v15;
  kern_return_t v16;
  mach_msg_type_number_t v17;
  mach_msg_type_number_t v18;
  mach_msg_header_t v20;
  int v21;
  vm_offset_t v22;
  int v23;
  mach_msg_type_number_t v24;
  NDR_record_t v25;
  uint32_t v26;
  mach_msg_type_number_t v27;
  int v28;
  int v29;
  kern_return_t v30;
  memory_object_offset_t v21 = 1;
  sigset_t v22 = request_data;
  int32x2_t v23 = 16777472;
  int v24 = request_dataCnt;
  uint64_t v25 = NDR_record;
  int v26 = user_log_flags;
  unint64_t v27 = request_dataCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v20.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v20.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v20.uint64_t msgh_voucher_port = 0x1A900000000LL;
  size_t v15 = mach_msg2_internal( &v20,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0x1A900000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x58,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (v20.msgh_id == 71)
      {
        uint64_t v16 = -308;
      }

      else if (v20.msgh_id == 525)
      {
        if ((v20.msgh_bits & 0x80000000) == 0)
        {
          if (v20.msgh_size == 36)
          {
            uint64_t v16 = -300;
            if (HIDWORD(v22))
            {
              if (v20.msgh_remote_port) {
                uint64_t v16 = -300;
              }
              else {
                uint64_t v16 = HIDWORD(v22);
              }
            }
          }

          else
          {
            uint64_t v16 = -300;
          }

          goto LABEL_24;
        }

        uint64_t v16 = -300;
        if (v21 == 2 && v20.msgh_size == 80 && !v20.msgh_remote_port && HIBYTE(v23) == 1 && HIBYTE(v26) == 1)
        {
          mach_vm_offset_t v17 = v24;
          if (v24 == v28)
          {
            BOOLean_t v18 = v27;
            if (v27 == v29)
            {
              uint64_t v16 = 0;
              *response_data = v22;
              *response_dataCnt = v17;
              *log_data = (vm_offset_t)v25;
              *log_dataCnt = v18;
              *op_uint64_t result = v30;
              return v16;
            }
          }
        }
      }

      else
      {
        uint64_t v16 = -301;
      }

kern_return_t host_security_create_task_token( host_security_t host_security, task_t parent_task, security_token_t sec_token, audit_token_t *audit_token, host_t host, ledger_array_t ledgers, mach_msg_type_number_t ledgersCnt, BOOLean_t inherit_memory, task_t *child_task)
{
  kern_return_t v12;
  kern_return_t v13;
  mach_msg_header_t v15;
  int v16;
  task_t v17;
  kern_return_t v18;
  int v19;
  host_t v20;
  int v21;
  ledger_array_t v22;
  int v23;
  mach_msg_type_number_t v24;
  NDR_record_t v25;
  security_token_t v26;
  __int128 v27;
  __int128 v28;
  mach_msg_type_number_t v29;
  BOOLean_t v30;
  __int128 v10 = *(_OWORD *)&audit_token->val[4];
  unint64_t v27 = *(_OWORD *)audit_token->val;
  uint64_t v16 = 3;
  mach_vm_offset_t v17 = parent_task;
  uint64_t v19 = 1245184;
  uint64_t v20 = host;
  memory_object_offset_t v21 = 1245184;
  sigset_t v22 = ledgers;
  int32x2_t v23 = 34799616;
  int v24 = ledgersCnt;
  uint64_t v25 = NDR_record;
  int v26 = sec_token;
  unint64_t v28 = v10;
  unint64_t v29 = ledgersCnt;
  int v30 = inherit_memory;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 0x7C80001513LL;
  *(void *)&v15.msgh_remote_port = __PAIR64__(reply_port, host_security);
  *(void *)&v15.uint64_t msgh_voucher_port = 0x25800000000LL;
  NDR_record_t v12 = mach_msg2_internal( &v15,  0x200000003uLL,  (void *)0x7C80001513LL,  (void *)__PAIR64__(reply_port, host_security),  (void *)0x25800000000LL,  (void *)((reply_port << 32) | 3),  (void *)0x30,  0LL);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v13 = -308;
      }

      else if (v15.msgh_id == 700)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v13 = -300;
            if (v18)
            {
              if (v15.msgh_remote_port) {
                uint64_t v13 = -300;
              }
              else {
                uint64_t v13 = v18;
              }
            }
          }

          else
          {
            uint64_t v13 = -300;
          }

          goto LABEL_20;
        }

        uint64_t v13 = -300;
        if (v16 == 1 && *(void *)&v15.msgh_size == 40LL && HIWORD(v19) << 16 == 1114112)
        {
          uint64_t v13 = 0;
          *child_task = v17;
          return v13;
        }
      }

      else
      {
        uint64_t v13 = -301;
      }

kern_return_t host_security_set_task_token( host_security_t host_security, task_t target_task, security_token_t sec_token, audit_token_t *audit_token, host_t host)
{
  kern_return_t v8;
  kern_return_t v9;
  mach_msg_header_t v11;
  int v12;
  task_t v13;
  kern_return_t v14;
  int v15;
  host_t v16;
  int v17;
  NDR_record_t v18;
  security_token_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v6 = *(_OWORD *)&audit_token->val[4];
  uint64_t v20 = *(_OWORD *)audit_token->val;
  NDR_record_t v12 = 2;
  uint64_t v13 = target_task;
  size_t v15 = 1245184;
  uint64_t v16 = host;
  mach_vm_offset_t v17 = 1245184;
  BOOLean_t v18 = NDR_record;
  uint64_t v19 = sec_token;
  memory_object_offset_t v21 = v6;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x6480001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, host_security);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x25900000000LL;
  mach_msg_type_number_t v8 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x6480001513LL,  (void *)__PAIR64__(reply_port, host_security),  (void *)0x25900000000LL,  (void *)((reply_port << 32) | 2),  (void *)0x2C,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v9;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v9 = -308;
    }

    else if (v11.msgh_id == 701)
    {
      uint64_t v9 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        uint64_t v9 = v14;
        if (!v14) {
          return v9;
        }
      }
    }

    else
    {
      uint64_t v9 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v9;
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  host_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[280];
  BOOLean_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *host_info_outCnt;
  if (*host_info_outCnt >= 0x44) {
    mach_msg_type_number_t v7 = 68;
  }
  uint64_t v19 = flavor;
  uint64_t v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xC800000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xC800000000LL,  (void *)(reply_port << 32),  (void *)0x140,  0LL);
  __int128 v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      __int128 v10 = -308;
    }

    else if (v17.msgh_id == 300)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 313 <= 0xFFFFFEEE)
        {
          if (v17.msgh_remote_port) {
            NDR_record_t v12 = 1;
          }
          else {
            NDR_record_t v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            __int128 v10 = v19;
          }
          else {
            __int128 v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          __int128 v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          size_t v15 = v20;
          if (v20 <= 0x44 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            uint64_t v16 = *host_info_outCnt;
            if (v20 <= v16)
            {
              memmove(host_info_out, v21, 4LL * v20);
              __int128 v10 = 0;
              *host_info_outCnt = v15;
            }

            else
            {
              memmove(host_info_out, v21, 4 * v16);
              *host_info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      __int128 v10 = -300;
    }

    else
    {
      __int128 v10 = -301;
    }

kern_return_t host_kernel_version(host_t host, kernel_version_t kernel_version)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  uint64_t v11;
  int v12;
  mach_msg_header_t v13;
  kern_return_t v14;
  mach_msg_size_t v15;
  _BYTE v16[524];
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC900000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xC900000000LL,  (void *)(reply_port << 32),  (void *)0x234,  0LL);
  __int128 v6 = v5;
  if (v5)
  {
    mig_dealloc_reply_port(v13.msgh_local_port);
    return v6;
  }

  if (v13.msgh_id == 71)
  {
    __int128 v6 = -308;
LABEL_25:
    mach_msg_destroy(&v13);
    return v6;
  }

  if (v13.msgh_id != 301)
  {
    __int128 v6 = -301;
    goto LABEL_25;
  }

  if ((v13.msgh_bits & 0x80000000) != 0) {
    goto LABEL_24;
  }
  if (v13.msgh_size - 557 <= 0xFFFFFDFE)
  {
    if (v13.msgh_remote_port) {
      mach_msg_type_number_t v8 = 1;
    }
    else {
      mach_msg_type_number_t v8 = v14 == 0;
    }
    if (!v8 && v13.msgh_size == 36) {
      __int128 v6 = v14;
    }
    else {
      __int128 v6 = -300;
    }
    goto LABEL_25;
  }

  if (v13.msgh_remote_port)
  {
LABEL_24:
    __int128 v6 = -300;
    goto LABEL_25;
  }

  __int128 v6 = v14;
  if (v14) {
    goto LABEL_25;
  }
  __int128 v6 = -300;
  if (v15 > 0x200 || v13.msgh_size - 44 < v15 || v13.msgh_size != ((v15 + 3) & 0xFFFFFFFC) + 44) {
    goto LABEL_25;
  }
  unsigned int v11 = 0LL;
  while (1)
  {
    NDR_record_t v12 = v16[v11];
    kernel_version[v11] = v12;
    if (!v12) {
      break;
    }
    if ((_DWORD)++v11 == 511)
    {
      __int128 v6 = 0;
      kernel_version[v11] = 0;
      return v6;
    }
  }

  return 0;
}

kern_return_t _host_page_size(host_t host, vm_size_t *out_page_size)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  mach_msg_header_t v10;
  kern_return_t v11;
  vm_size_t v12;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA00000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCA00000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  __int128 v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      __int128 v6 = -308;
    }

    else if (v10.msgh_id == 302)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 44)
        {
          if (!v10.msgh_remote_port)
          {
            __int128 v6 = v11;
            if (!v11)
            {
              *out_page_size = v12;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            mach_msg_type_number_t v8 = 1;
          }
          else {
            mach_msg_type_number_t v8 = v11 == 0;
          }
          if (v8) {
            __int128 v6 = -300;
          }
          else {
            __int128 v6 = v11;
          }
          goto LABEL_23;
        }
      }

      __int128 v6 = -300;
    }

    else
    {
      __int128 v6 = -301;
    }

kern_return_t mach_memory_object_memory_entry( host_t host, BOOLean_t internal, vm_size_t size, vm_prot_t permission, memory_object_t pager, mach_port_t *entry_handle)
{
  kern_return_t v9;
  kern_return_t v10;
  mach_msg_header_t v12;
  int v13;
  memory_object_t v14;
  kern_return_t v15;
  int v16;
  NDR_record_t v17;
  BOOLean_t v18;
  vm_size_t v19;
  vm_prot_t v20;
  uint64_t v13 = 1;
  char v14 = pager;
  uint64_t v16 = 1245184;
  mach_vm_offset_t v17 = NDR_record;
  BOOLean_t v18 = internal;
  uint64_t v19 = size;
  uint64_t v20 = permission;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xCB00000000LL;
  uint64_t v9 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCB00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  __int128 v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v12.msgh_id == 71)
      {
        __int128 v10 = -308;
      }

      else if (v12.msgh_id == 303)
      {
        if ((v12.msgh_bits & 0x80000000) == 0)
        {
          if (v12.msgh_size == 36)
          {
            __int128 v10 = -300;
            if (v15)
            {
              if (v12.msgh_remote_port) {
                __int128 v10 = -300;
              }
              else {
                __int128 v10 = v15;
              }
            }
          }

          else
          {
            __int128 v10 = -300;
          }

          goto LABEL_20;
        }

        __int128 v10 = -300;
        if (v13 == 1 && *(void *)&v12.msgh_size == 40LL && HIWORD(v16) << 16 == 1114112)
        {
          __int128 v10 = 0;
          *entry_handle = v14;
          return v10;
        }
      }

      else
      {
        __int128 v10 = -301;
      }

kern_return_t host_processor_info( host_t host, processor_flavor_t flavor, natural_t *out_processor_count, processor_info_array_t *out_processor_info, mach_msg_type_number_t *out_processor_infoCnt)
{
  kern_return_t v10;
  kern_return_t v11;
  mach_msg_type_number_t v13;
  mach_msg_header_t v15;
  _BYTE v16[12];
  char v17;
  unsigned int v18;
  natural_t v19;
  int v20;
  *(NDR_record_t *)uint64_t v16 = NDR_record;
  *(_DWORD *)&v16[8] = flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v15.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v15.uint64_t msgh_voucher_port = 0xCC00000000LL;
  __int128 v10 = mach_msg2_internal( &v15,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCC00000000LL,  (void *)(reply_port << 32),  (void *)0x44,  0LL);
  unsigned int v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (v15.msgh_id == 71)
      {
        unsigned int v11 = -308;
      }

      else if (v15.msgh_id == 304)
      {
        if ((v15.msgh_bits & 0x80000000) != 0)
        {
          unsigned int v11 = -300;
          if (*(_DWORD *)v16 == 1 && v15.msgh_size == 60 && !v15.msgh_remote_port && v17 == 1)
          {
            uint64_t v13 = v18 >> 2;
            if (v18 >> 2 == v20)
            {
              unsigned int v11 = 0;
              *out_processor_count = v19;
              *out_processor_uint64_t info = *(processor_info_array_t *)&v16[4];
              *out_processor_infoCnt = v13;
              return v11;
            }
          }
        }

        else if (v15.msgh_size == 36)
        {
          unsigned int v11 = -300;
          if (*(_DWORD *)&v16[8])
          {
            if (v15.msgh_remote_port) {
              unsigned int v11 = -300;
            }
            else {
              unsigned int v11 = *(_DWORD *)&v16[8];
            }
          }
        }

        else
        {
          unsigned int v11 = -300;
        }
      }

      else
      {
        unsigned int v11 = -301;
      }

      mach_msg_destroy(&v15);
      return v11;
    }

    mig_dealloc_reply_port(v15.msgh_local_port);
  }

  return v11;
}

kern_return_t host_get_io_main(host_t host, io_main_t *io_main)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  io_main_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xCD00000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCD00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  __int128 v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        __int128 v6 = -308;
      }

      else if (v9.msgh_id == 305)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          __int128 v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            __int128 v6 = 0;
            *io_main = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          __int128 v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              __int128 v6 = -300;
            }
            else {
              __int128 v6 = v12;
            }
          }
        }

        else
        {
          __int128 v6 = -300;
        }
      }

      else
      {
        __int128 v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t host_get_clock_service(host_t host, clock_id_t clock_id, clock_serv_t *clock_serv)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  clock_id_t v12;
  unsigned __int16 v13;
  unsigned int v11 = NDR_record;
  NDR_record_t v12 = clock_id;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCE00000000LL;
  __int128 v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCE00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        mach_msg_type_number_t v7 = -308;
      }

      else if (v10.msgh_id == 306)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            mach_msg_type_number_t v7 = 0;
            *clock_serv = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          mach_msg_type_number_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              mach_msg_type_number_t v7 = -300;
            }
            else {
              mach_msg_type_number_t v7 = v12;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v7 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t kmod_get_info(host_t host, kmod_args_t *modules, mach_msg_type_number_t *modulesCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  void *v14;
  char v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xCF00000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xCF00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v12.msgh_id == 307)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 1)
          {
            __int128 v10 = v16;
            if (v16 == v17)
            {
              mach_msg_type_number_t v8 = 0;
              *modules = v14;
              *modulesCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t host_virtual_physical_table_info( host_t host, hash_info_bucket_array_t *info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  hash_info_bucket_t *v14;
  char v15;
  unsigned int v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD100000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xD100000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v12.msgh_id == 309)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 1)
          {
            __int128 v10 = v16 >> 2;
            if (v16 >> 2 == v17)
            {
              mach_msg_type_number_t v8 = 0;
              *uint64_t info = v14;
              *infoCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t processor_set_default(host_t host, processor_set_name_t *default_set)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_name_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD500000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xD500000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  __int128 v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        __int128 v6 = -308;
      }

      else if (v9.msgh_id == 313)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          __int128 v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            __int128 v6 = 0;
            *default_set = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          __int128 v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              __int128 v6 = -300;
            }
            else {
              __int128 v6 = v12;
            }
          }
        }

        else
        {
          __int128 v6 = -300;
        }
      }

      else
      {
        __int128 v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t processor_set_create(host_t host, processor_set_t *new_set, processor_set_name_t *new_name)
{
  kern_return_t v7;
  kern_return_t v8;
  processor_set_name_t v10;
  mach_msg_header_t v12;
  int v13;
  processor_set_t v14;
  kern_return_t v15;
  unsigned __int16 v16;
  processor_set_name_t v17;
  unsigned __int16 v18;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD600000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xD600000000LL,  (void *)(reply_port << 32),  (void *)0x3C,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v12.msgh_id == 314)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13 == 2 && *(void *)&v12.msgh_size == 52LL && v16 << 16 == 1114112 && v18 << 16 == 1114112)
          {
            mach_msg_type_number_t v8 = 0;
            __int128 v10 = v17;
            *new_set = v14;
            *new_mach_port_name_t name = v10;
            return v8;
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (v15)
          {
            if (v12.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = v15;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t mach_memory_object_memory_entry_64( host_t host, BOOLean_t internal, memory_object_size_t size, vm_prot_t permission, memory_object_t pager, mach_port_t *entry_handle)
{
  kern_return_t v9;
  kern_return_t v10;
  mach_msg_header_t v12;
  int v13;
  memory_object_t v14;
  kern_return_t v15;
  int v16;
  NDR_record_t v17;
  BOOLean_t v18;
  memory_object_size_t v19;
  vm_prot_t v20;
  uint64_t v13 = 1;
  char v14 = pager;
  uint64_t v16 = 1245184;
  mach_vm_offset_t v17 = NDR_record;
  BOOLean_t v18 = internal;
  uint64_t v19 = size;
  uint64_t v20 = permission;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD700000000LL;
  uint64_t v9 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xD700000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  __int128 v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v12.msgh_id == 71)
      {
        __int128 v10 = -308;
      }

      else if (v12.msgh_id == 315)
      {
        if ((v12.msgh_bits & 0x80000000) == 0)
        {
          if (v12.msgh_size == 36)
          {
            __int128 v10 = -300;
            if (v15)
            {
              if (v12.msgh_remote_port) {
                __int128 v10 = -300;
              }
              else {
                __int128 v10 = v15;
              }
            }
          }

          else
          {
            __int128 v10 = -300;
          }

          goto LABEL_20;
        }

        __int128 v10 = -300;
        if (v13 == 1 && *(void *)&v12.msgh_size == 40LL && HIWORD(v16) << 16 == 1114112)
        {
          __int128 v10 = 0;
          *entry_handle = v14;
          return v10;
        }
      }

      else
      {
        __int128 v10 = -301;
      }

kern_return_t host_statistics( host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  host_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[280];
  BOOLean_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *host_info_outCnt;
  if (*host_info_outCnt >= 0x44) {
    mach_msg_type_number_t v7 = 68;
  }
  uint64_t v19 = flavor;
  uint64_t v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xD800000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0xD800000000LL,  (void *)(reply_port << 32),  (void *)0x140,  0LL);
  __int128 v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      __int128 v10 = -308;
    }

    else if (v17.msgh_id == 316)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 313 <= 0xFFFFFEEE)
        {
          if (v17.msgh_remote_port) {
            NDR_record_t v12 = 1;
          }
          else {
            NDR_record_t v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            __int128 v10 = v19;
          }
          else {
            __int128 v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          __int128 v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          size_t v15 = v20;
          if (v20 <= 0x44 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            uint64_t v16 = *host_info_outCnt;
            if (v20 <= v16)
            {
              memmove(host_info_out, v21, 4LL * v20);
              __int128 v10 = 0;
              *host_info_outCnt = v15;
            }

            else
            {
              memmove(host_info_out, v21, 4 * v16);
              *host_info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      __int128 v10 = -300;
    }

    else
    {
      __int128 v10 = -301;
    }

kern_return_t host_request_notification(host_t host, host_flavor_t notify_type, mach_port_t notify_port)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  mach_port_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  host_flavor_t v15;
  __int128 v10 = 1;
  unsigned int v11 = notify_port;
  uint64_t v13 = 1376256;
  char v14 = NDR_record;
  size_t v15 = notify_type;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD900000000LL;
  memory_object_default_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xD900000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  __int128 v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      __int128 v6 = -308;
    }

    else if (v9.msgh_id == 317)
    {
      __int128 v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        __int128 v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      __int128 v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t host_lockgroup_info( host_t host, lockgroup_info_array_t *lockgroup_info, mach_msg_type_number_t *lockgroup_infoCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  lockgroup_info_t *v14;
  char v15;
  unsigned int v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xDA00000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xDA00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_type_number_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_type_number_t v8 = -308;
      }

      else if (v12.msgh_id == 318)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 1)
          {
            __int128 v10 = v16 / 0x108;
            if (v16 / 0x108 == v17)
            {
              mach_msg_type_number_t v8 = 0;
              *lockgroup_uint64_t info = v14;
              *lockgroup_infoCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_type_number_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_type_number_t v8 = -300;
            }
            else {
              mach_msg_type_number_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_type_number_t v8 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t host_statistics64( host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  host_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[1032];
  BOOLean_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *host_info64_outCnt;
  if (*host_info64_outCnt >= 0x100) {
    mach_msg_type_number_t v7 = 256;
  }
  uint64_t v19 = flavor;
  uint64_t v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xDB00000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0xDB00000000LL,  (void *)(reply_port << 32),  (void *)0x430,  0LL);
  __int128 v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      __int128 v10 = -308;
    }

    else if (v17.msgh_id == 319)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 1065 <= 0xFFFFFBFE)
        {
          if (v17.msgh_remote_port) {
            NDR_record_t v12 = 1;
          }
          else {
            NDR_record_t v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            __int128 v10 = v19;
          }
          else {
            __int128 v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          __int128 v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          size_t v15 = v20;
          if (v20 <= 0x100 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            uint64_t v16 = *host_info64_outCnt;
            if (v20 <= v16)
            {
              memmove(host_info64_out, v21, 4LL * v20);
              __int128 v10 = 0;
              *host_info64_outCnt = v15;
            }

            else
            {
              memmove(host_info64_out, v21, 4 * v16);
              *host_info64_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      __int128 v10 = -300;
    }

    else
    {
      __int128 v10 = -301;
    }

kern_return_t mach_zone_info( host_priv_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_type_number_t v14;
  mach_msg_type_number_t v15;
  mach_msg_header_t v17;
  int v18;
  mach_zone_name_t *v19;
  char v20;
  unsigned int v21;
  mach_zone_info_t *v22;
  char v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xDC00000000LL;
  unsigned int v11 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xDC00000000LL,  (void *)(reply_port << 32),  (void *)0x54,  0LL);
  NDR_record_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v17.msgh_id == 71)
      {
        NDR_record_t v12 = -308;
      }

      else if (v17.msgh_id == 320)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          NDR_record_t v12 = -300;
          if (v18 == 2 && v17.msgh_size == 76 && !v17.msgh_remote_port && v20 == 1 && v23 == 1)
          {
            char v14 = v21 / 0x50;
            if (v21 / 0x50 == v25)
            {
              size_t v15 = v24 >> 6;
              if (v24 >> 6 == v26)
              {
                NDR_record_t v12 = 0;
                *names = v19;
                *namesCnt = v14;
                *uint64_t info = v22;
                *infoCnt = v15;
                return v12;
              }
            }
          }
        }

        else if (v17.msgh_size == 36)
        {
          NDR_record_t v12 = -300;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              NDR_record_t v12 = -300;
            }
            else {
              NDR_record_t v12 = HIDWORD(v19);
            }
          }
        }

        else
        {
          NDR_record_t v12 = -300;
        }
      }

      else
      {
        NDR_record_t v12 = -301;
      }

      mach_msg_destroy(&v17);
      return v12;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v12;
}

uint64_t mach_zone_force_gc(unsigned int a1)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xDD00000000LL;
  int64_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xDD00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (v7.msgh_id == 321)
    {
      uint64_t v4 = 4294966996LL;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        uint64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

uint64_t _kernelrpc_host_create_mach_voucher(unsigned int a1, const void *a2, size_t __n, _DWORD *a4)
{
  NDR_record_t v13 = NDR_record;
  unsigned int v6 = __n;
  memmove(v15, a2, __n);
  unsigned int v14 = v6;
  unint64_t v8 = ((v6 + 3) & 0xFFFFFFFC) + 36;
  uint64_t reply_port = mig_get_reply_port();
  v12.mach_msg_bits_t msgh_bits = 5395;
  v12.msgh_size = v8;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xDE00000000LL;
  int64_t v10 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)(((unint64_t)(v8 >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xDE00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v4 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v4 = 4294966988LL;
      }

      else if (v12.msgh_id == 322)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v4 = 4294966996LL;
          if (*(_DWORD *)&v13.mig_vers == 1 && v12.msgh_size == 40 && !v12.msgh_remote_port && v15[1] << 16 == 1114112)
          {
            uint64_t v4 = 0LL;
            *a4 = *(_DWORD *)&v13.int_rep;
            return v4;
          }
        }

        else if (v12.msgh_size == 36)
        {
          uint64_t v4 = 4294966996LL;
          if (v14)
          {
            if (v12.msgh_remote_port) {
              uint64_t v4 = 4294966996LL;
            }
            else {
              uint64_t v4 = v14;
            }
          }
        }

        else
        {
          uint64_t v4 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v4 = 4294966995LL;
      }

      mach_msg_destroy(&v12);
      return v4;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v4;
}

kern_return_t host_register_mach_voucher_attr_manager( host_t host, mach_voucher_attr_manager_t attr_manager, mach_voucher_attr_value_handle_t default_value, mach_voucher_attr_key_t *new_key, ipc_voucher_attr_control_t *new_attr_control)
{
  kern_return_t v9;
  kern_return_t v10;
  ipc_voucher_attr_control_t v12;
  mach_msg_header_t v14;
  int v15;
  mach_voucher_attr_manager_t v16;
  kern_return_t v17;
  int v18;
  NDR_record_t v19;
  mach_voucher_attr_value_handle_t v20;
  size_t v15 = 1;
  uint64_t v16 = attr_manager;
  BOOLean_t v18 = 1245184;
  uint64_t v19 = NDR_record;
  uint64_t v20 = default_value;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x3880001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xDF00000000LL;
  uint64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x3880001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xDF00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  int64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v14.msgh_id == 71)
      {
        int64_t v10 = -308;
      }

      else if (v14.msgh_id == 323)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          int64_t v10 = -300;
          if (v15 == 1 && *(void *)&v14.msgh_size == 52LL && HIWORD(v18) << 16 == 1114112)
          {
            int64_t v10 = 0;
            mach_msg_header_t v12 = v16;
            *new_key = v20;
            *new_attr_control = v12;
            return v10;
          }
        }

        else if (v14.msgh_size == 36)
        {
          int64_t v10 = -300;
          if (v17)
          {
            if (v14.msgh_remote_port) {
              int64_t v10 = -300;
            }
            else {
              int64_t v10 = v17;
            }
          }
        }

        else
        {
          int64_t v10 = -300;
        }
      }

      else
      {
        int64_t v10 = -301;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

kern_return_t host_register_well_known_mach_voucher_attr_manager( host_t host, mach_voucher_attr_manager_t attr_manager, mach_voucher_attr_value_handle_t default_value, mach_voucher_attr_key_t key, ipc_voucher_attr_control_t *new_attr_control)
{
  kern_return_t v8;
  kern_return_t v9;
  mach_msg_header_t v12;
  int v13;
  mach_voucher_attr_manager_t v14;
  kern_return_t v15;
  int v16;
  NDR_record_t v17;
  mach_voucher_attr_value_handle_t v18;
  mach_voucher_attr_key_t v19;
  NDR_record_t v13 = 1;
  unsigned int v14 = attr_manager;
  uint64_t v16 = 1245184;
  mach_vm_offset_t v17 = NDR_record;
  BOOLean_t v18 = default_value;
  uint64_t v19 = key;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xE000000000LL;
  unint64_t v8 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xE000000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v9 = -308;
      }

      else if (v12.msgh_id == 324)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 40LL && HIWORD(v16) << 16 == 1114112)
          {
            uint64_t v9 = 0;
            *new_attr_control = v14;
            return v9;
          }
        }

        else if (v12.msgh_size == 36)
        {
          uint64_t v9 = -300;
          if (v15)
          {
            if (v12.msgh_remote_port) {
              uint64_t v9 = -300;
            }
            else {
              uint64_t v9 = v15;
            }
          }
        }

        else
        {
          uint64_t v9 = -300;
        }
      }

      else
      {
        uint64_t v9 = -301;
      }

      mach_msg_destroy(&v12);
      return v9;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v9;
}

kern_return_t host_set_atm_diagnostic_flag(host_priv_t host_priv, uint32_t diagnostic_flag)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  uint32_t v10;
  uint64_t v9 = NDR_record;
  int64_t v10 = diagnostic_flag;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE100000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0xE100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  memory_object_default_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      memory_object_default_t v5 = -308;
    }

    else if (v8.msgh_id == 325)
    {
      memory_object_default_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        memory_object_default_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      memory_object_default_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t mach_memory_info( host_priv_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  kern_return_t v15;
  kern_return_t v16;
  mach_msg_type_number_t v18;
  mach_msg_type_number_t v19;
  mach_msg_type_number_t v20;
  mach_msg_header_t v22;
  int v23;
  mach_zone_name_t *v24;
  char v25;
  unsigned int v26;
  mach_zone_info_t *v27;
  char v28;
  unsigned int v29;
  mach_memory_info_t *v30;
  char v31;
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v22.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v22.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v22.uint64_t msgh_voucher_port = 0xE300000000LL;
  size_t v15 = mach_msg2_internal( &v22,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xE300000000LL,  (void *)(reply_port << 32),  (void *)0x68,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (v22.msgh_id == 71)
      {
        uint64_t v16 = -308;
      }

      else if (v22.msgh_id == 327)
      {
        if ((v22.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v16 = -300;
          if (v23 == 3 && v22.msgh_size == 96 && !v22.msgh_remote_port && v25 == 1 && v28 == 1 && v31 == 1)
          {
            BOOLean_t v18 = v26 / 0x50;
            if (v26 / 0x50 == v33)
            {
              uint64_t v19 = v29 >> 6;
              if (v29 >> 6 == v34)
              {
                uint64_t v20 = v32 / 0xB0;
                if (v32 / 0xB0 == v35)
                {
                  uint64_t v16 = 0;
                  *names = v24;
                  *namesCnt = v18;
                  *uint64_t info = v27;
                  *infoCnt = v19;
                  *memory_uint64_t info = v30;
                  *memory_infoCnt = v20;
                  return v16;
                }
              }
            }
          }
        }

        else if (v22.msgh_size == 36)
        {
          uint64_t v16 = -300;
          if (HIDWORD(v24))
          {
            if (v22.msgh_remote_port) {
              uint64_t v16 = -300;
            }
            else {
              uint64_t v16 = HIDWORD(v24);
            }
          }
        }

        else
        {
          uint64_t v16 = -300;
        }
      }

      else
      {
        uint64_t v16 = -301;
      }

      mach_msg_destroy(&v22);
      return v16;
    }

    mig_dealloc_reply_port(v22.msgh_local_port);
  }

  return v16;
}

kern_return_t host_set_multiuser_config_flags(host_priv_t host_priv, uint32_t multiuser_flags)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  uint32_t v10;
  uint64_t v9 = NDR_record;
  int64_t v10 = multiuser_flags;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, host_priv);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE400000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, host_priv),  (void *)0xE400000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  memory_object_default_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      memory_object_default_t v5 = -308;
    }

    else if (v8.msgh_id == 328)
    {
      memory_object_default_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        memory_object_default_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      memory_object_default_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t mach_zone_info_for_zone(host_priv_t host, mach_zone_name_t *name, mach_zone_info_t *info)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  mach_msg_header_t v14;
  NDR_record_t v15;
  _BYTE v16[80];
  size_t v15 = NDR_record;
  __int128 v5 = *(_OWORD *)&name->mzn_name[48];
  *(_OWORD *)&v16[32] = *(_OWORD *)&name->mzn_name[32];
  *(_OWORD *)&v16[48] = v5;
  *(_OWORD *)&v16[64] = *(_OWORD *)&name->mzn_name[64];
  __int128 v6 = *(_OWORD *)&name->mzn_name[16];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)name->mzn_name;
  *(_OWORD *)&v16[16] = v6;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x7000001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, host);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xE700000000LL;
  unint64_t v8 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x7000001513LL,  (void *)__PAIR64__(reply_port, host),  (void *)0xE700000000LL,  (void *)(reply_port << 32),  (void *)0x6C,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v9 = -308;
      }

      else if (v14.msgh_id == 331)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 100)
          {
            if (!v14.msgh_remote_port)
            {
              uint64_t v9 = *(_DWORD *)v16;
              if (!*(_DWORD *)v16)
              {
                mach_msg_header_t v12 = *(_OWORD *)&v16[20];
                *(_OWORD *)&info->mzi_count = *(_OWORD *)&v16[4];
                *(_OWORD *)&info->mzi_max_size = v12;
                NDR_record_t v13 = *(_OWORD *)&v16[52];
                *(_OWORD *)&info->mzi_alloc_size = *(_OWORD *)&v16[36];
                *(_OWORD *)&info->mzi_exhaustible = v13;
                return v9;
              }

              goto LABEL_20;
            }
          }

          else if (v14.msgh_size == 36)
          {
            if (v14.msgh_remote_port) {
              int64_t v10 = 1;
            }
            else {
              int64_t v10 = *(_DWORD *)v16 == 0;
            }
            if (v10) {
              uint64_t v9 = -300;
            }
            else {
              uint64_t v9 = *(_DWORD *)v16;
            }
            goto LABEL_20;
          }
        }

        uint64_t v9 = -300;
      }

      else
      {
        uint64_t v9 = -301;
      }

uint64_t mach_zone_info_for_largest_zone(unsigned int a1, _OWORD *a2, _OWORD *a3)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v16.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v16.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v16.uint64_t msgh_voucher_port = 0xE800000000LL;
  int64_t v7 = mach_msg2_internal( &v16,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xE800000000LL,  (void *)(reply_port << 32),  (void *)0xBC,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v8;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v16.msgh_id == 332)
    {
      if ((v16.msgh_bits & 0x80000000) == 0)
      {
        if (v16.msgh_size == 180)
        {
          if (!v16.msgh_remote_port)
          {
            uint64_t v8 = v17;
            if (!v17)
            {
              __int128 v12 = v19;
              __int128 v13 = v21;
              a2[2] = v20;
              a2[3] = v13;
              a2[4] = v22;
              *a2 = v18;
              a2[1] = v12;
              __int128 v14 = v26;
              a3[2] = v25;
              a3[3] = v14;
              __int128 v15 = v24;
              *a3 = v23;
              a3[1] = v15;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v16.msgh_size == 36)
        {
          if (v16.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = v17 == 0;
          }
          if (v10) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v17;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t mach_zone_get_zlog_zones(unsigned int a1, void *a2, unsigned int *a3)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xE900000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xE900000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v12.msgh_id == 333)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v8 = 4294966996LL;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 1)
          {
            unsigned int v10 = v16 / 0x50;
            if (v16 / 0x50 == v17)
            {
              uint64_t v8 = 0LL;
              *a2 = v14;
              *a3 = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          uint64_t v8 = 4294966996LL;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          uint64_t v8 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

uint64_t mach_zone_get_btlog_records(unsigned int a1, _OWORD *a2, void *a3, _DWORD *a4)
{
  *(NDR_record_t *)char v15 = NDR_record;
  __int128 v7 = a2[3];
  __int128 v17 = a2[2];
  __int128 v18 = v7;
  __int128 v19 = a2[4];
  __int128 v8 = a2[1];
  *(_OWORD *)&v15[8] = *a2;
  __int128 v16 = v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x7000001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xEA00000000LL;
  int64_t v10 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x7000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xEA00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v14.msgh_id == 334)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (*(_DWORD *)&v15[8])
            {
              if (v14.msgh_remote_port) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = *(unsigned int *)&v15[8];
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_21;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)v15 == 1 && *(void *)&v14.msgh_size == 56LL && v15[15] == 1)
        {
          int v12 = *(_DWORD *)&v15[16] >> 7;
          if (*(_DWORD *)&v15[16] >> 7 == DWORD1(v16))
          {
            uint64_t v11 = 0LL;
            *a3 = *(void *)&v15[4];
            *a4 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t _kernelrpc_mach_port_names( unsigned int a1, void *a2, unsigned int *a3, void *a4, unsigned int *a5)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xC8000000000LL;
  int64_t v11 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8000000000LL,  (void *)(reply_port << 32),  (void *)0x54,  0LL);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (v17.msgh_id == 3300)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996LL;
          if (v18 == 2 && v17.msgh_size == 76 && !v17.msgh_remote_port && v20 == 1 && v23 == 1)
          {
            unsigned int v14 = v21 >> 2;
            if (v21 >> 2 == v25)
            {
              unsigned int v15 = v24 >> 2;
              if (v24 >> 2 == v26)
              {
                uint64_t v12 = 0LL;
                *a2 = v19;
                *a3 = v14;
                *a4 = v22;
                *a5 = v15;
                return v12;
              }
            }
          }
        }

        else if (v17.msgh_size == 36)
        {
          uint64_t v12 = 4294966996LL;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v19);
            }
          }
        }

        else
        {
          uint64_t v12 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

      mach_msg_destroy(&v17);
      return v12;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v12;
}

uint64_t _kernelrpc_mach_port_type(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xC8100000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8100000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v11.msgh_id == 3301)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v7 = v13;
            if (!v13)
            {
              *a3 = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_rename(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC8200000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3302)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_allocate_name(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC8300000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3303)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_allocate(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xC8400000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8400000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v11.msgh_id == 3304)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v7 = v13;
            if (!v13)
            {
              *a3 = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_destroy(unsigned int a1, unsigned int a2)
{
  NDR_record_t v9 = NDR_record;
  unsigned int v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xC8500000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8500000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 3305)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

uint64_t _kernelrpc_mach_port_deallocate(unsigned int a1, unsigned int a2)
{
  NDR_record_t v9 = NDR_record;
  unsigned int v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xC8600000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 3306)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

uint64_t _kernelrpc_mach_port_get_refs(unsigned int a1, unsigned int a2, int a3, _DWORD *a4)
{
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  int v15 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xC8700000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8700000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v12.msgh_id == 3307)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = v14;
            if (!v14)
            {
              *a4 = v15;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = v14 == 0;
          }
          if (v10) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v14;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_mod_refs(unsigned int a1, unsigned int a2, int a3, int a4)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  int v13 = a3;
  int v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xC8800000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8800000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3308)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        uint64_t v7 = v12;
        if (!v12) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_peek( unsigned int a1, unsigned int a2, int a3, int *a4, _DWORD *a5, int *a6, void *a7, int *a8)
{
  NDR_record_t v25 = NDR_record;
  unsigned int v26 = a2;
  int v27 = a3;
  int v14 = *a8;
  int v28 = *a4;
  int v29 = v14;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v24.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v24.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v24.uint64_t msgh_voucher_port = 0xC8900000000LL;
  int64_t v16 = mach_msg2_internal( &v24,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8900000000LL,  (void *)(reply_port << 32),  (void *)0x80,  0LL);
  uint64_t v17 = v16;
  if ((_DWORD)v16)
  {
    mig_dealloc_reply_port(v24.msgh_local_port);
    return v17;
  }

  if (v24.msgh_id == 71)
  {
    uint64_t v17 = 4294966988LL;
LABEL_24:
    mach_msg_destroy(&v24);
    return v17;
  }

  if (v24.msgh_id != 3309)
  {
    uint64_t v17 = 4294966995LL;
    goto LABEL_24;
  }

  if ((v24.msgh_bits & 0x80000000) != 0) {
    goto LABEL_23;
  }
  if (v24.msgh_size - 121 <= 0xFFFFFFBA)
  {
    if (v24.msgh_remote_port) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v26 == 0;
    }
    if (!v18 && v24.msgh_size == 36) {
      uint64_t v17 = v26;
    }
    else {
      uint64_t v17 = 4294966996LL;
    }
    goto LABEL_24;
  }

  if (v24.msgh_remote_port)
  {
LABEL_23:
    uint64_t v17 = 4294966996LL;
    goto LABEL_24;
  }

  uint64_t v17 = v26;
  if (v26) {
    goto LABEL_24;
  }
  size_t v21 = __n;
  uint64_t v17 = 4294966996LL;
  if (__n > 0x44 || v24.msgh_size - 52 < __n || v24.msgh_size != ((__n + 3) & 0xFFFFFFFC) + 52) {
    goto LABEL_24;
  }
  int v22 = v28;
  *a4 = v27;
  *a5 = v22;
  *a6 = v29;
  size_t v23 = *a8;
  if (v21 <= v23)
  {
    memmove(a7, __n_4, v21);
    uint64_t v17 = 0LL;
    *a8 = v21;
  }

  else
  {
    memmove(a7, __n_4, v23);
    *a8 = v21;
    return 4294966989LL;
  }

  return v17;
}

uint64_t _kernelrpc_mach_port_set_mscount(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC8A00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8A00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3310)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_get_set_status(unsigned int a1, int a2, void *a3, unsigned int *a4)
{
  *(NDR_record_t *)int v14 = NDR_record;
  *(_DWORD *)&v14[8] = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC8B00000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8B00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (v13.msgh_id == 3311)
      {
        if ((v13.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)v14 == 1 && *(void *)&v13.msgh_size == 56LL && v15 == 1)
          {
            unsigned int v11 = v16 >> 2;
            if (v16 >> 2 == v17)
            {
              uint64_t v9 = 0LL;
              *a3 = *(void *)&v14[4];
              *a4 = v11;
              return v9;
            }
          }
        }

        else if (v13.msgh_size == 36)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)&v14[8])
          {
            if (v13.msgh_remote_port) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = *(unsigned int *)&v14[8];
            }
          }
        }

        else
        {
          uint64_t v9 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

      mach_msg_destroy(&v13);
      return v9;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v9;
}

uint64_t _kernelrpc_mach_port_move_member(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC8C00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8C00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3312)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_request_notification( unsigned int a1, int a2, int a3, int a4, int a5, unsigned __int8 a6, _DWORD *a7)
{
  int v14 = 1;
  int v15 = a5;
  int v17 = a6 << 16;
  NDR_record_t v18 = NDR_record;
  int v19 = a2;
  int v20 = a3;
  int v21 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC8D00000000LL;
  int64_t v10 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8D00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v13.msgh_id == 3313)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (v16)
            {
              if (v13.msgh_remote_port) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = v16;
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_20;
        }

        uint64_t v11 = 4294966996LL;
        if (v14 == 1 && *(void *)&v13.msgh_size == 40LL && HIWORD(v17) << 16 == 1179648)
        {
          uint64_t v11 = 0LL;
          *a7 = v15;
          return v11;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t _kernelrpc_mach_port_insert_right(unsigned int a1, int a2, int a3, unsigned __int8 a4)
{
  int v11 = 1;
  int v12 = a3;
  int v14 = a4 << 16;
  NDR_record_t v15 = NDR_record;
  int v16 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xC8E00000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8E00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3314)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        uint64_t v7 = v13;
        if (!v13) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_extract_right( unsigned int a1, unsigned int a2, unsigned int a3, _DWORD *a4, unsigned int *a5)
{
  NDR_record_t v15 = NDR_record;
  unsigned int v16 = a2;
  unsigned int v17 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xC8F00000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC8F00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v14.msgh_id == 3315)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (*(_DWORD *)&v15.mig_vers == 1 && *(void *)&v14.msgh_size == 40LL)
          {
            unsigned int v12 = v17;
            if (!HIBYTE(v17))
            {
              uint64_t v10 = 0LL;
              *a4 = *(_DWORD *)&v15.int_rep;
              *a5 = HIWORD(v12);
              return v10;
            }
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (v16)
          {
            if (v14.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v16;
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

uint64_t _kernelrpc_mach_port_set_seqno(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC9000000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3316)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_get_attributes( unsigned int a1, unsigned int a2, mach_msg_size_t a3, void *a4, int *a5)
{
  NDR_record_t v19 = NDR_record;
  unsigned int v20 = a2;
  mach_msg_size_t v21 = a3;
  int v8 = *a5;
  v22[0] = v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v18.uint64_t msgh_voucher_port = 0xC9100000000LL;
  int64_t v10 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9100000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_reply_port(v18.msgh_local_port);
      return v11;
    }

    if (v18.msgh_id == 71)
    {
      uint64_t v11 = 4294966988LL;
    }

    else if (v18.msgh_id == 3317)
    {
      if ((v18.msgh_bits & 0x80000000) == 0)
      {
        if (v18.msgh_size - 109 <= 0xFFFFFFBA)
        {
          if (v18.msgh_remote_port) {
            BOOL v13 = 1;
          }
          else {
            BOOL v13 = v20 == 0;
          }
          if (!v13 && v18.msgh_size == 36) {
            uint64_t v11 = v20;
          }
          else {
            uint64_t v11 = 4294966996LL;
          }
          goto LABEL_27;
        }

        if (!v18.msgh_remote_port)
        {
          uint64_t v11 = v20;
          if (v20) {
            goto LABEL_27;
          }
          mach_msg_size_t v16 = v21;
          if (v21 <= 0x11 && v21 <= (v18.msgh_size - 40) >> 2 && v18.msgh_size == 4 * v21 + 40)
          {
            uint64_t v17 = *a5;
            if (v21 <= v17)
            {
              memmove(a4, v22, 4LL * v21);
              uint64_t v11 = 0LL;
              *a5 = v16;
            }

            else
            {
              memmove(a4, v22, 4 * v17);
              *a5 = v16;
              return 4294966989LL;
            }

            return v11;
          }
        }
      }

      uint64_t v11 = 4294966996LL;
    }

    else
    {
      uint64_t v11 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_set_attributes( unsigned int a1, unsigned int a2, int a3, void *__src, unsigned int a5)
{
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  int v15 = a3;
  if (a5 > 0x11) {
    return 4294966989LL;
  }
  int v8 = 4 * a5;
  memmove(&v17, __src, 4 * a5);
  unsigned int v16 = a5;
  uint64_t reply_port = mig_get_reply_port();
  v12.mach_msg_bits_t msgh_bits = 5395;
  v12.msgh_size = v8 + 44;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xC9200000000LL;
  int64_t v10 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)(((unint64_t)((v8 + 44) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v5;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v12.msgh_id == 3318)
    {
      uint64_t v5 = 4294966996LL;
      if ((v12.msgh_bits & 0x80000000) == 0 && v12.msgh_size == 36 && !v12.msgh_remote_port)
      {
        uint64_t v5 = v14;
        if (!v14) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v12);
  }

  return v5;
}

uint64_t _kernelrpc_mach_port_allocate_qos(unsigned int a1, unsigned int a2, uint64_t *a3, _DWORD *a4)
{
  NDR_record_t v14 = NDR_record;
  unsigned int v15 = a2;
  uint64_t v16 = *a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC9300000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9300000000LL,  (void *)(reply_port << 32),  (void *)0x38,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 3319)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 48)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!v15)
            {
              *a3 = v16;
              *a4 = v17;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_allocate_full(unsigned int a1, int a2, int a3, uint64_t *a4, int *a5)
{
  int v14 = 1;
  int v15 = a3;
  *(_DWORD *)int v17 = 1245184;
  *(NDR_record_t *)&_OWORD v17[4] = NDR_record;
  int v18 = a2;
  uint64_t v19 = *a4;
  int v20 = *a5;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC9400000000LL;
  int64_t v9 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9400000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x38,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v13.msgh_id == 3320)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 48)
          {
            if (!v13.msgh_remote_port)
            {
              uint64_t v10 = v16;
              if (!v16)
              {
                *a4 = *(void *)v17;
                *a5 = *(_DWORD *)&v17[8];
                return v10;
              }

              goto LABEL_20;
            }
          }

          else if (v13.msgh_size == 36)
          {
            if (v13.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = v16 == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v16;
            }
            goto LABEL_20;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t _kernelrpc_task_set_port_space(unsigned int a1, unsigned int a2)
{
  NDR_record_t v9 = NDR_record;
  unsigned int v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xC9500000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9500000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 3321)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

uint64_t _kernelrpc_mach_port_get_srights(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xC9600000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9600000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v11.msgh_id == 3322)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v7 = v13;
            if (!v13)
            {
              *a3 = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_space_info( unsigned int a1, uint64_t a2, void *a3, unsigned int *a4, void *a5, unsigned int *a6)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v19.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v19.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v19.uint64_t msgh_voucher_port = 0xC9700000000LL;
  int64_t v13 = mach_msg2_internal( &v19,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9700000000LL,  (void *)(reply_port << 32),  (void *)0x6C,  0LL);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v19.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v19.msgh_id == 3323)
      {
        if ((v19.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996LL;
          if (v20 == 2 && *(void *)&v19.msgh_size == 100LL && v22 == 1 && v25 == 1)
          {
            unsigned int v16 = v23 / 0x1C;
            if (v23 / 0x1C == v29)
            {
              unsigned int v17 = v26 / 0x24;
              if (v26 / 0x24 == v30)
              {
                uint64_t v14 = 0LL;
                *(_OWORD *)a2 = v27;
                *(void *)(a2 + 16) = v28;
                *a3 = v21;
                *a4 = v16;
                *a5 = v24;
                *a6 = v17;
                return v14;
              }
            }
          }
        }

        else if (v19.msgh_size == 36)
        {
          uint64_t v14 = 4294966996LL;
          if (HIDWORD(v21))
          {
            if (v19.msgh_remote_port) {
              uint64_t v14 = 4294966996LL;
            }
            else {
              uint64_t v14 = HIDWORD(v21);
            }
          }
        }

        else
        {
          uint64_t v14 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

      mach_msg_destroy(&v19);
      return v14;
    }

    mig_dealloc_reply_port(v19.msgh_local_port);
  }

  return v14;
}

uint64_t _kernelrpc_mach_port_dnrequest_info(unsigned int a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  NDR_record_t v15 = NDR_record;
  unsigned int v16 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xC9800000000LL;
  int64_t v8 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9800000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v9;
    }

    if (v14.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v14.msgh_id == 3324)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 44)
        {
          if (!v14.msgh_remote_port)
          {
            uint64_t v9 = v16;
            if (!v16)
            {
              int v13 = v18;
              *a3 = v17;
              *a4 = v13;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v16 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_kernel_object(unsigned int a1, unsigned int a2, _DWORD *a3, _DWORD *a4)
{
  NDR_record_t v15 = NDR_record;
  unsigned int v16 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xC9900000000LL;
  int64_t v8 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9900000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v9;
    }

    if (v14.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v14.msgh_id == 3325)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 44)
        {
          if (!v14.msgh_remote_port)
          {
            uint64_t v9 = v16;
            if (!v16)
            {
              int v13 = v18;
              *a3 = v17;
              *a4 = v13;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v16 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_insert_member(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC9A00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9A00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3326)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_extract_member(unsigned int a1, unsigned int a2, int a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC9B00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9B00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3327)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_get_context(unsigned int a1, unsigned int a2, void *a3)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xC9C00000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9C00000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v11.msgh_id == 3328)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 44)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v7 = v13;
            if (!v13)
            {
              *a3 = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_set_context(unsigned int a1, unsigned int a2, uint64_t a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  uint64_t v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xC9D00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9D00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3329)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_kobject(unsigned int a1, unsigned int a2, _DWORD *a3, void *a4)
{
  NDR_record_t v14 = NDR_record;
  unsigned int v15 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xC9E00000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9E00000000LL,  (void *)(reply_port << 32),  (void *)0x38,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 3330)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 48)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!v15)
            {
              *a3 = v16;
              *a4 = v17;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_construct(unsigned int a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v13 = 1;
  uint64_t v14 = a2;
  uint64_t v15 = 0x1801000100LL;
  NDR_record_t v16 = NDR_record;
  uint64_t v17 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xC9F00000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xC9F00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v12.msgh_id == 3331)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a4 = v15;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_destruct(unsigned int a1, unsigned int a2, int a3, uint64_t a4)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  int v13 = a3;
  uint64_t v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA000000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3332)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        uint64_t v7 = v12;
        if (!v12) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_guard(unsigned int a1, unsigned int a2, uint64_t a3, int a4)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  uint64_t v13 = a3;
  int v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA100000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3333)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        uint64_t v7 = v12;
        if (!v12) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_unguard(unsigned int a1, unsigned int a2, uint64_t a3)
{
  NDR_record_t v10 = NDR_record;
  unsigned int v11 = a2;
  uint64_t v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xCA200000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 3334)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_port_space_basic_info(unsigned int a1, uint64_t a2)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA300000000LL;
  int64_t v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA300000000LL,  (void *)(reply_port << 32),  (void *)0x44,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v10.msgh_id == 3335)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 60)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v6 = v11;
            if (!v11)
            {
              *(_OWORD *)a2 = v12;
              *(void *)(a2 + 16) = v13;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v11 == 0;
          }
          if (v8) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v11;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_special_reply_port_reset_link(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xCA400000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA400000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v11.msgh_id == 3336)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            uint64_t v7 = v13;
            if (!v13)
            {
              *a3 = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v13 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_guard_with_flags(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA500000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA500000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3337)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        uint64_t v7 = v12;
        if (!v12) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_swap_guard(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  NDR_record_t v11 = NDR_record;
  unsigned int v12 = a2;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xCA600000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3338)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        uint64_t v7 = v12;
        if (!v12) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_port_kobject_description( unsigned int a1, unsigned int a2, _DWORD *a3, void *a4, uint64_t a5)
{
  NDR_record_t v19 = NDR_record;
  unsigned int v20 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v18.uint64_t msgh_voucher_port = 0xCA700000000LL;
  int64_t v10 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA700000000LL,  (void *)(reply_port << 32),  (void *)0x240,  0LL);
  uint64_t v11 = v10;
  if ((_DWORD)v10)
  {
    mig_dealloc_reply_port(v18.msgh_local_port);
    return v11;
  }

  if (v18.msgh_id == 71)
  {
    uint64_t v11 = 4294966988LL;
LABEL_25:
    mach_msg_destroy(&v18);
    return v11;
  }

  if (v18.msgh_id != 3339)
  {
    uint64_t v11 = 4294966995LL;
    goto LABEL_25;
  }

  if ((v18.msgh_bits & 0x80000000) != 0) {
    goto LABEL_24;
  }
  if (v18.msgh_size - 569 <= 0xFFFFFDFE)
  {
    if (v18.msgh_remote_port) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = v20 == 0;
    }
    if (!v13 && v18.msgh_size == 36) {
      uint64_t v11 = v20;
    }
    else {
      uint64_t v11 = 4294966996LL;
    }
    goto LABEL_25;
  }

  if (v18.msgh_remote_port)
  {
LABEL_24:
    uint64_t v11 = 4294966996LL;
    goto LABEL_25;
  }

  uint64_t v11 = v20;
  if (v20) {
    goto LABEL_25;
  }
  uint64_t v11 = 4294966996LL;
  if (v23 > 0x200 || v18.msgh_size - 56 < v23 || v18.msgh_size != ((v23 + 3) & 0xFFFFFFFC) + 56) {
    goto LABEL_25;
  }
  uint64_t v16 = 0LL;
  *a3 = v21;
  *a4 = v22;
  while (1)
  {
    int v17 = v24[v16];
    *(_BYTE *)(a5 + v16) = v17;
    if (!v17) {
      break;
    }
    if ((_DWORD)++v16 == 511)
    {
      uint64_t v11 = 0LL;
      *(_BYTE *)(a5 + v16) = 0;
      return v11;
    }
  }

  return 0LL;
}

uint64_t _kernelrpc_mach_port_is_connection_for_service(unsigned int a1, unsigned int a2, int a3, void *a4)
{
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  LODWORD(v15) = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xCA800000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA800000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v12.msgh_id == 3340)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 44)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = v14;
            if (!v14)
            {
              *a4 = v15;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = v14 == 0;
          }
          if (v10) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v14;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_get_service_port_info(unsigned int a1, unsigned int a2, _OWORD *a3)
{
  NDR_record_t v20 = NDR_record;
  unsigned int v21 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v19.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v19.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v19.uint64_t msgh_voucher_port = 0xCA900000000LL;
  int64_t v6 = mach_msg2_internal( &v19,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xCA900000000LL,  (void *)(reply_port << 32),  (void *)0x12C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v19.msgh_local_port);
      return v7;
    }

    if (v19.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v19.msgh_id == 3341)
    {
      if ((v19.msgh_bits & 0x80000000) == 0)
      {
        if (v19.msgh_size == 292)
        {
          if (!v19.msgh_remote_port)
          {
            uint64_t v7 = v21;
            if (!v21)
            {
              __int128 v11 = v35;
              a3[12] = v34;
              a3[13] = v11;
              __int128 v12 = v31;
              a3[8] = v30;
              a3[9] = v12;
              __int128 v13 = v33;
              a3[10] = v32;
              a3[11] = v13;
              __int128 v14 = v27;
              a3[4] = v26;
              a3[5] = v14;
              __int128 v15 = v29;
              a3[6] = v28;
              a3[7] = v15;
              __int128 v16 = v23;
              *a3 = v22;
              a3[1] = v16;
              __int128 v17 = v25;
              a3[2] = v24;
              a3[3] = v17;
              __int128 v18 = v37;
              a3[14] = v36;
              a3[15] = v18;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v19.msgh_size == 36)
        {
          if (v19.msgh_remote_port) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = v21 == 0;
          }
          if (v9) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v21;
          }
          goto LABEL_23;
        }
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_port_assert_attributes( unsigned int a1, unsigned int a2, int a3, void *__src, unsigned int a5)
{
  NDR_record_t v13 = NDR_record;
  unsigned int v14 = a2;
  int v15 = a3;
  if (a5 > 0x11) {
    return 4294966989LL;
  }
  int v8 = 4 * a5;
  memmove(&v17, __src, 4 * a5);
  unsigned int v16 = a5;
  uint64_t reply_port = mig_get_reply_port();
  v12.mach_msg_bits_t msgh_bits = 5395;
  v12.msgh_size = v8 + 44;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xCAA00000000LL;
  int64_t v10 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)(((unint64_t)((v8 + 44) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xCAA00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v10)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v5;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v12.msgh_id == 3342)
    {
      uint64_t v5 = 4294966996LL;
      if ((v12.msgh_bits & 0x80000000) == 0 && v12.msgh_size == 36 && !v12.msgh_remote_port)
      {
        uint64_t v5 = v14;
        if (!v14) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v12);
  }

  return v5;
}

uint64_t _kernelrpc_mach_vm_allocate(unsigned int a1, uint64_t *a2, uint64_t a3, int a4)
{
  uint64_t v6 = *a2;
  NDR_record_t v14 = NDR_record;
  *(void *)&__int128 v15 = v6;
  *((void *)&v15 + 1) = a3;
  int v16 = a4;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12C000000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12C000000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 4900)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 44)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *a2 = *(void *)((char *)&v15 + 4);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_mach_vm_deallocate(unsigned int a1, uint64_t a2, uint64_t a3)
{
  NDR_record_t v10 = NDR_record;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x12C100000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12C100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v9.msgh_id == 4901)
    {
      uint64_t v6 = 4294966996LL;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        uint64_t v6 = v11;
        if (!(_DWORD)v11) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

uint64_t _kernelrpc_mach_vm_protect(unsigned int a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  NDR_record_t v12 = NDR_record;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  int v15 = a4;
  int v16 = a5;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x12C200000000LL;
  int64_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12C200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v8;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v11.msgh_id == 4902)
    {
      uint64_t v8 = 4294966996LL;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        uint64_t v8 = v13;
        if (!(_DWORD)v13) {
          return v8;
        }
      }
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

    mach_msg_destroy(&v11);
  }

  return v8;
}

kern_return_t mach_vm_inherit( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_inherit_t new_inheritance)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  vm_inherit_t v14;
  mach_msg_header_t v11 = NDR_record;
  NDR_record_t v12 = address;
  uint64_t v13 = size;
  uint64_t v14 = new_inheritance;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C300000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4903)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_vm_read(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5)
{
  *(NDR_record_t *)&__int128 v15 = NDR_record;
  *((void *)&v15 + 1) = a2;
  uint64_t v16 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12C400000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12C400000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v14.msgh_id == 4904)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if ((_DWORD)v15 == 1 && *(void *)&v14.msgh_size == 56LL && HIBYTE(v15) == 1)
          {
            int v12 = v16;
            if ((_DWORD)v16 == v17)
            {
              uint64_t v10 = 0LL;
              *a4 = *(void *)((char *)&v15 + 4);
              *a5 = v12;
              return v10;
            }
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (DWORD2(v15))
          {
            if (v14.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = DWORD2(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

kern_return_t mach_vm_read_list(vm_map_read_t target_task, mach_vm_read_entry_t data_list, natural_t count)
{
  kern_return_t v7;
  kern_return_t v8;
  BOOL v10;
  mach_msg_header_t v12;
  NDR_record_t v13;
  kern_return_t v14;
  _DWORD v15[1027];
  uint64_t v13 = NDR_record;
  memmove(&v14, data_list, 0x1000uLL);
  v15[1023] = count;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x102400001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x12C500000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x102400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C500000000LL,  (void *)(reply_port << 32),  (void *)0x102C,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = -308;
    }

    else if (v12.msgh_id == 4905)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 4132)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = v14;
            if (!v14)
            {
              memmove(data_list, v15, 0x1000uLL);
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = v14 == 0;
          }
          if (v10) {
            uint64_t v8 = -300;
          }
          else {
            uint64_t v8 = v14;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = -300;
    }

    else
    {
      uint64_t v8 = -301;
    }

kern_return_t mach_vm_write( vm_map_t target_task, mach_vm_address_t address, vm_offset_t data, mach_msg_type_number_t dataCnt)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v9;
  int v10;
  vm_offset_t v11;
  int v12;
  mach_msg_type_number_t v13;
  NDR_record_t v14;
  mach_vm_address_t v15;
  mach_msg_type_number_t v16;
  uint64_t v10 = 1;
  mach_msg_header_t v11 = data;
  int v12 = 16777472;
  uint64_t v13 = dataCnt;
  mach_msg_header_t v14 = NDR_record;
  __int128 v15 = address;
  uint64_t v16 = dataCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x12C600000000LL;
  uint64_t v6 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C600000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v7;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v9.msgh_id == 4906)
    {
      int64_t v7 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int64_t v7 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v7;
}

kern_return_t mach_vm_copy( vm_map_t target_task, mach_vm_address_t source_address, mach_vm_size_t size, mach_vm_address_t dest_address)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  mach_vm_address_t v14;
  mach_msg_header_t v11 = NDR_record;
  int v12 = source_address;
  uint64_t v13 = size;
  mach_msg_header_t v14 = dest_address;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C700000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4907)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t mach_vm_read_overwrite( vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  NDR_record_t v14;
  __int128 v15;
  mach_vm_address_t v16;
  mach_msg_header_t v14 = NDR_record;
  *(void *)&__int128 v15 = address;
  *((void *)&v15 + 1) = size;
  uint64_t v16 = data;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12C800000000LL;
  uint64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C800000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  int64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      int64_t v9 = -308;
    }

    else if (v13.msgh_id == 4908)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 44)
        {
          if (!v13.msgh_remote_port)
          {
            int64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *outsize = *(void *)((char *)&v15 + 4);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            mach_msg_header_t v11 = 1;
          }
          else {
            mach_msg_header_t v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            int64_t v9 = -300;
          }
          else {
            int64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      int64_t v9 = -300;
    }

    else
    {
      int64_t v9 = -301;
    }

kern_return_t mach_vm_msync( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_sync_t sync_flags)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  vm_sync_t v14;
  mach_msg_header_t v11 = NDR_record;
  int v12 = address;
  uint64_t v13 = size;
  mach_msg_header_t v14 = sync_flags;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C900000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4909)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t mach_vm_behavior_set( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_behavior_t new_behavior)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_vm_address_t v12;
  mach_vm_size_t v13;
  vm_behavior_t v14;
  mach_msg_header_t v11 = NDR_record;
  int v12 = address;
  uint64_t v13 = size;
  mach_msg_header_t v14 = new_behavior;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12CA00000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CA00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4910)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_vm_map( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, int a10)
{
  int v19 = 1;
  int v20 = a6;
  v22[0] = 1245184;
  uint64_t v12 = *a2;
  *(NDR_record_t *)&v22[1] = NDR_record;
  *(void *)&v22[3] = v12;
  *(void *)&v22[5] = a3;
  *(void *)&v22[7] = a4;
  v22[9] = a5;
  uint64_t v23 = a7;
  int v24 = a8;
  uint64_t v25 = a9;
  int v26 = a10;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x6480001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v18.uint64_t msgh_voucher_port = 0x12CB00000000LL;
  int64_t v14 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x6480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12CB00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x34,  0LL);
  uint64_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v14)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (v18.msgh_id == 4911)
      {
        if ((v18.msgh_bits & 0x80000000) == 0)
        {
          if (v18.msgh_size == 44)
          {
            if (!v18.msgh_remote_port)
            {
              uint64_t v15 = v21;
              if (!v21)
              {
                *a2 = *(void *)v22;
                return v15;
              }

              goto LABEL_20;
            }
          }

          else if (v18.msgh_size == 36)
          {
            if (v18.msgh_remote_port) {
              BOOL v16 = 1;
            }
            else {
              BOOL v16 = v21 == 0;
            }
            if (v16) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = v21;
            }
            goto LABEL_20;
          }
        }

        uint64_t v15 = 4294966996LL;
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

kern_return_t mach_vm_machine_attribute( vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_machine_attribute_t attribute, vm_machine_attribute_val_t *value)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_header_t v14;
  NDR_record_t v15;
  mach_vm_address_t v16;
  mach_vm_size_t v17;
  vm_machine_attribute_t v18;
  vm_machine_attribute_val_t v19;
  uint64_t v15 = NDR_record;
  BOOL v16 = address;
  int v17 = size;
  vm_machine_attribute_val_t v7 = *value;
  mach_msg_header_t v18 = attribute;
  int v19 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12CC00000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CC00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v10;
    }

    if (v14.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v14.msgh_id == 4912)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 40)
        {
          if (!v14.msgh_remote_port)
          {
            uint64_t v10 = v16;
            if (!(_DWORD)v16)
            {
              *value = HIDWORD(v16);
              return v10;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = (_DWORD)v16 == 0;
          }
          if (v12) {
            uint64_t v10 = -300;
          }
          else {
            uint64_t v10 = v16;
          }
          goto LABEL_23;
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

uint64_t _kernelrpc_mach_vm_remap( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, _DWORD *a9, _DWORD *a10, int a11)
{
  int v21 = 1;
  int v22 = a6;
  *(_DWORD *)int v24 = 1245184;
  uint64_t v13 = *a2;
  *(NDR_record_t *)&v24[4] = NDR_record;
  uint64_t v25 = v13;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  int v28 = a5;
  uint64_t v29 = a7;
  int v30 = a8;
  int v31 = a11;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v20.mach_msg_bits_t msgh_bits = 0x5C80001513LL;
  *(void *)&v20.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v20.uint64_t msgh_voucher_port = 0x12CD00000000LL;
  int64_t v15 = mach_msg2_internal( &v20,  0x200000003uLL,  (void *)0x5C80001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12CD00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v15)
    {
      if (v20.msgh_id == 71)
      {
        uint64_t v16 = 4294966988LL;
      }

      else if (v20.msgh_id == 4913)
      {
        if ((v20.msgh_bits & 0x80000000) == 0)
        {
          if (v20.msgh_size == 52)
          {
            if (!v20.msgh_remote_port)
            {
              uint64_t v16 = v23;
              if (!v23)
              {
                *a2 = *(void *)v24;
                int v19 = v25;
                *a9 = *(_DWORD *)&v24[8];
                *a10 = v19;
                return v16;
              }

              goto LABEL_20;
            }
          }

          else if (v20.msgh_size == 36)
          {
            if (v20.msgh_remote_port) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = v23 == 0;
            }
            if (v17) {
              uint64_t v16 = 4294966996LL;
            }
            else {
              uint64_t v16 = v23;
            }
            goto LABEL_20;
          }
        }

        uint64_t v16 = 4294966996LL;
      }

      else
      {
        uint64_t v16 = 4294966995LL;
      }

kern_return_t mach_vm_page_query( vm_map_read_t target_map, mach_vm_offset_t offset, integer_t *disposition, integer_t *ref_count)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  integer_t v13;
  mach_msg_header_t v14;
  NDR_record_t v15;
  mach_vm_offset_t v16;
  integer_t v17;
  int64_t v15 = NDR_record;
  uint64_t v16 = offset;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_map);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12CE00000000LL;
  uint64_t v8 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_map),  (void *)0x12CE00000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  int64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v9;
    }

    if (v14.msgh_id == 71)
    {
      int64_t v9 = -308;
    }

    else if (v14.msgh_id == 4914)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 44)
        {
          if (!v14.msgh_remote_port)
          {
            int64_t v9 = v16;
            if (!(_DWORD)v16)
            {
              uint64_t v13 = v17;
              *disposition = HIDWORD(v16);
              *ref_count = v13;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            mach_msg_header_t v11 = 1;
          }
          else {
            mach_msg_header_t v11 = (_DWORD)v16 == 0;
          }
          if (v11) {
            int64_t v9 = -300;
          }
          else {
            int64_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      int64_t v9 = -300;
    }

    else
    {
      int64_t v9 = -301;
    }

kern_return_t mach_vm_region_recurse( vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v15;
  kern_return_t v16;
  BOOL v17;
  mach_msg_type_number_t v20;
  size_t v21;
  uint64_t v22;
  mach_msg_header_t v23;
  NDR_record_t v24;
  _BYTE v25[12];
  mach_vm_size_t v26;
  natural_t v27;
  mach_msg_size_t v28;
  _BYTE v29[84];
  mach_vm_address_t v12 = *address;
  int v24 = NDR_record;
  *(void *)uint64_t v25 = v12;
  mach_msg_type_number_t v13 = *infoCnt;
  if (*infoCnt >= 0x13) {
    mach_msg_type_number_t v13 = 19;
  }
  *(_DWORD *)&v25[8] = *nesting_depth;
  LODWORD(v26) = v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v23.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v23.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v23.uint64_t msgh_voucher_port = 0x12CF00000000LL;
  int64_t v15 = mach_msg2_internal( &v23,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CF00000000LL,  (void *)(reply_port << 32),  (void *)0x90,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(v23.msgh_local_port);
      return v16;
    }

    if (v23.msgh_id == 71)
    {
      uint64_t v16 = -308;
    }

    else if (v23.msgh_id == 4915)
    {
      if ((v23.msgh_bits & 0x80000000) == 0)
      {
        if (v23.msgh_size - 137 <= 0xFFFFFFB2)
        {
          if (v23.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = *(_DWORD *)v25 == 0;
          }
          if (!v17 && v23.msgh_size == 36) {
            uint64_t v16 = *(_DWORD *)v25;
          }
          else {
            uint64_t v16 = -300;
          }
          goto LABEL_24;
        }

        if (!v23.msgh_remote_port)
        {
          uint64_t v16 = *(_DWORD *)v25;
          if (*(_DWORD *)v25) {
            goto LABEL_24;
          }
          mach_msg_header_t v20 = v28;
          if (v28 <= 0x13 && v28 <= (v23.msgh_size - 60) >> 2)
          {
            int v21 = 4LL * v28;
            if (v23.msgh_size == 4 * v28 + 60)
            {
              *mach_vm_address_t address = *(void *)&v25[4];
              *size = v26;
              *nesting_depth = v27;
              int v22 = *infoCnt;
              if (v20 <= v22)
              {
                memmove(info, v29, v21);
                uint64_t v16 = 0;
                *infoCnt = v20;
              }

              else
              {
                memmove(info, v29, 4 * v22);
                *infoCnt = v20;
                return -307;
              }

              return v16;
            }
          }
        }
      }

      uint64_t v16 = -300;
    }

    else
    {
      uint64_t v16 = -301;
    }

kern_return_t mach_vm_region( vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  kern_return_t v16;
  kern_return_t v17;
  mach_msg_type_number_t v19;
  size_t v20;
  mach_vm_size_t v21;
  uint64_t v22;
  mach_msg_header_t v24;
  NDR_record_t v25;
  mach_vm_address_t v26;
  vm_region_flavor_t v27;
  mach_msg_type_number_t v28;
  mach_vm_address_t v29;
  mach_vm_size_t v30;
  mach_msg_size_t v31;
  _BYTE v32[52];
  mach_vm_address_t v13 = *address;
  uint64_t v25 = NDR_record;
  uint64_t v26 = v13;
  mach_msg_type_number_t v14 = *infoCnt;
  if (*infoCnt >= 0xA) {
    mach_msg_type_number_t v14 = 10;
  }
  uint64_t v27 = flavor;
  int v28 = v14;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v24.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v24.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v24.uint64_t msgh_voucher_port = 0x12D000000000LL;
  uint64_t v16 = mach_msg2_internal( &v24,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D000000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  BOOL v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (v16)
    {
      mig_dealloc_reply_port(v24.msgh_local_port);
      return v17;
    }

    if (v24.msgh_id == 71)
    {
      BOOL v17 = -308;
    }

    else if (v24.msgh_id == 4916)
    {
      if ((v24.msgh_bits & 0x80000000) != 0)
      {
        BOOL v17 = -300;
        if (*(_DWORD *)&v25.mig_vers == 1
          && v24.msgh_size >= 0x44
          && v24.msgh_size <= 0x6C
          && !v24.msgh_remote_port
          && HIWORD(v26) << 16 == 1114112)
        {
          int v19 = v31;
          if (v31 <= 0xA && v31 <= (v24.msgh_size - 68) >> 2)
          {
            mach_msg_header_t v20 = 4LL * v31;
            if (v24.msgh_size == 4 * v31 + 68)
            {
              int v21 = v30;
              *mach_vm_address_t address = v29;
              *size = v21;
              int v22 = *infoCnt;
              if (v19 <= v22)
              {
                memmove(info, v32, v20);
                BOOL v17 = 0;
                *infoCnt = v19;
                *object_mach_port_name_t name = *(_DWORD *)&v25.int_rep;
              }

              else
              {
                memmove(info, v32, 4 * v22);
                *infoCnt = v19;
                return -307;
              }

              return v17;
            }
          }
        }
      }

      else if (v24.msgh_size == 36)
      {
        BOOL v17 = -300;
        if ((_DWORD)v26)
        {
          if (v24.msgh_remote_port) {
            BOOL v17 = -300;
          }
          else {
            BOOL v17 = v26;
          }
        }
      }

      else
      {
        BOOL v17 = -300;
      }
    }

    else
    {
      BOOL v17 = -301;
    }

    mach_msg_destroy(&v24);
  }

  return v17;
}

kern_return_t mach_make_memory_entry( vm_map_t target_task, vm_size_t *size, vm_offset_t offset, vm_prot_t permission, mem_entry_name_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_header_t v14;
  int v15;
  mem_entry_name_port_t v16;
  kern_return_t v17;
  int v18;
  NDR_record_t v19;
  vm_size_t v20;
  vm_offset_t v21;
  vm_prot_t v22;
  int64_t v15 = 1;
  uint64_t v16 = parent_entry;
  mach_msg_header_t v18 = 1245184;
  vm_size_t v9 = *size;
  int v19 = NDR_record;
  mach_msg_header_t v20 = v9;
  int v21 = offset;
  int v22 = permission;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x4480001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12D100000000LL;
  mach_msg_header_t v11 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x4480001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D100000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x40,  0LL);
  mach_vm_address_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v14.msgh_id == 71)
      {
        mach_vm_address_t v12 = -308;
      }

      else if (v14.msgh_id == 4917)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            mach_vm_address_t v12 = -300;
            if (v17)
            {
              if (v14.msgh_remote_port) {
                mach_vm_address_t v12 = -300;
              }
              else {
                mach_vm_address_t v12 = v17;
              }
            }
          }

          else
          {
            mach_vm_address_t v12 = -300;
          }

          goto LABEL_21;
        }

        mach_vm_address_t v12 = -300;
        if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIWORD(v18) << 16 == 1114112)
        {
          mach_vm_address_t v12 = 0;
          *size = v20;
          *object_handle = v16;
          return v12;
        }
      }

      else
      {
        mach_vm_address_t v12 = -301;
      }

uint64_t _kernelrpc_mach_vm_purgable_control(unsigned int a1, uint64_t a2, int a3, int *a4)
{
  NDR_record_t v14 = NDR_record;
  uint64_t v15 = a2;
  int v6 = *a4;
  int v16 = a3;
  int v17 = v6;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12D200000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D200000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 4918)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *a4 = HIDWORD(v15);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

kern_return_t mach_vm_page_info( vm_map_read_t target_task, mach_vm_address_t address, vm_page_info_flavor_t flavor, vm_page_info_t info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v10;
  kern_return_t v11;
  BOOL v13;
  mach_msg_type_number_t v16;
  uint64_t v17;
  mach_msg_header_t v18;
  NDR_record_t v19;
  mach_vm_address_t v20;
  _DWORD v21[34];
  int v19 = NDR_record;
  mach_msg_header_t v20 = address;
  mach_msg_type_number_t v8 = *infoCnt;
  if (*infoCnt >= 0x20) {
    mach_msg_type_number_t v8 = 32;
  }
  v21[0] = flavor;
  v21[1] = v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v18.uint64_t msgh_voucher_port = 0x12D300000000LL;
  uint64_t v10 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D300000000LL,  (void *)(reply_port << 32),  (void *)0xB0,  0LL);
  BOOL v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (v10)
    {
      mig_dealloc_reply_port(v18.msgh_local_port);
      return v11;
    }

    if (v18.msgh_id == 71)
    {
      BOOL v11 = -308;
    }

    else if (v18.msgh_id == 4919)
    {
      if ((v18.msgh_bits & 0x80000000) == 0)
      {
        if (v18.msgh_size - 169 <= 0xFFFFFF7E)
        {
          if (v18.msgh_remote_port) {
            mach_msg_header_t v13 = 1;
          }
          else {
            mach_msg_header_t v13 = (_DWORD)v20 == 0;
          }
          if (!v13 && v18.msgh_size == 36) {
            BOOL v11 = v20;
          }
          else {
            BOOL v11 = -300;
          }
          goto LABEL_27;
        }

        if (!v18.msgh_remote_port)
        {
          BOOL v11 = v20;
          if ((_DWORD)v20) {
            goto LABEL_27;
          }
          int v16 = HIDWORD(v20);
          if (HIDWORD(v20) <= 0x20
            && HIDWORD(v20) <= (v18.msgh_size - 40) >> 2
            && v18.msgh_size == 4 * HIDWORD(v20) + 40)
          {
            int v17 = *infoCnt;
            if (HIDWORD(v20) <= v17)
            {
              memmove(info, v21, 4LL * HIDWORD(v20));
              BOOL v11 = 0;
              *infoCnt = v16;
            }

            else
            {
              memmove(info, v21, 4 * v17);
              *infoCnt = v16;
              return -307;
            }

            return v11;
          }
        }
      }

      BOOL v11 = -300;
    }

    else
    {
      BOOL v11 = -301;
    }

kern_return_t mach_vm_page_range_query( vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  NDR_record_t v14;
  __int128 v15;
  mach_vm_address_t v16;
  mach_vm_size_t v17;
  NDR_record_t v14 = NDR_record;
  *(void *)&uint64_t v15 = address;
  *((void *)&v15 + 1) = size;
  int v16 = dispositions;
  int v17 = *dispositions_count;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x4000001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, target_map);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12D400000000LL;
  mach_msg_type_number_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x4000001513LL,  (void *)__PAIR64__(reply_port, target_map),  (void *)0x12D400000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = -308;
    }

    else if (v13.msgh_id == 4920)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 44)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *dispositions_count = *(void *)((char *)&v15 + 4);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            uint64_t v9 = -300;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = -300;
    }

    else
    {
      uint64_t v9 = -301;
    }

uint64_t _kernelrpc_mach_vm_remap_new( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, int *a9, int *a10, int a11)
{
  int v22 = 1;
  int v23 = a6;
  *(_DWORD *)uint64_t v25 = 1245184;
  uint64_t v13 = *a2;
  *(NDR_record_t *)&v25[4] = NDR_record;
  uint64_t v26 = v13;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  int v29 = a5;
  uint64_t v30 = a7;
  int v14 = *a9;
  int v31 = a8;
  int v32 = v14;
  int v33 = *a10;
  int v34 = a11;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v21.mach_msg_bits_t msgh_bits = 0x6480001513LL;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v21.uint64_t msgh_voucher_port = 0x12D500000000LL;
  int64_t v16 = mach_msg2_internal( &v21,  0x200000003uLL,  (void *)0x6480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  uint64_t v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v16)
    {
      if (v21.msgh_id == 71)
      {
        uint64_t v17 = 4294966988LL;
      }

      else if (v21.msgh_id == 4921)
      {
        if ((v21.msgh_bits & 0x80000000) == 0)
        {
          if (v21.msgh_size == 52)
          {
            if (!v21.msgh_remote_port)
            {
              uint64_t v17 = v24;
              if (!v24)
              {
                *a2 = *(void *)v25;
                int v20 = v26;
                *a9 = *(_DWORD *)&v25[8];
                *a10 = v20;
                return v17;
              }

              goto LABEL_20;
            }
          }

          else if (v21.msgh_size == 36)
          {
            if (v21.msgh_remote_port) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v24 == 0;
            }
            if (v18) {
              uint64_t v17 = 4294966996LL;
            }
            else {
              uint64_t v17 = v24;
            }
            goto LABEL_20;
          }
        }

        uint64_t v17 = 4294966996LL;
      }

      else
      {
        uint64_t v17 = 4294966995LL;
      }

uint64_t mach_vm_deferred_reclamation_buffer_init(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  NDR_record_t v13 = NDR_record;
  *(void *)&__int128 v14 = v5;
  *((void *)&v14 + 1) = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x12D600000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D600000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v12.msgh_id == 4922)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 44)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = v14;
            if (!(_DWORD)v14)
            {
              *a2 = *(void *)((char *)&v14 + 4);
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = (_DWORD)v14 == 0;
          }
          if (v10) {
            uint64_t v8 = 4294966996LL;
          }
          else {
            uint64_t v8 = v14;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = 4294966996LL;
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

uint64_t mach_vm_deferred_reclamation_buffer_synchronize(unsigned int a1, uint64_t a2)
{
  NDR_record_t v9 = NDR_record;
  uint64_t v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x12D700000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 4923)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!(_DWORD)v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

uint64_t mach_vm_deferred_reclamation_buffer_update_reclaimable_bytes(unsigned int a1, uint64_t a2)
{
  NDR_record_t v9 = NDR_record;
  uint64_t v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0x12D800000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D800000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 4924)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!(_DWORD)v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t mach_vm_range_create( vm_map_t target_task, mach_vm_range_flavor_t flavor, mach_vm_range_recipes_raw_t recipes, mach_msg_type_number_t recipesCnt)
{
  kern_return_t v4;
  unint64_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  mach_vm_range_flavor_t v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  mach_msg_header_t v12 = NDR_record;
  NDR_record_t v13 = flavor;
  if (recipesCnt > 0x400) {
    return -307;
  }
  memmove(&v15, recipes, recipesCnt);
  __int128 v14 = recipesCnt;
  int64_t v7 = ((recipesCnt + 3) & 0xFFFFFFFC) + 40;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0x12D900000000LL;
  NDR_record_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)(v7 >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int64_t v4 = -308;
    }

    else if (v11.msgh_id == 4925)
    {
      int64_t v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int64_t v4 = v13;
        if (v13 == MACH_VM_RANGE_FLAVOR_INVALID) {
          return v4;
        }
      }
    }

    else
    {
      int64_t v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

uint64_t mach_notify_port_deleted(mach_port_t a1, int a2)
{
  NDR_record_t v5 = NDR_record;
  int v6 = a2;
  msg.mach_msg_bits_t msgh_bits = 18;
  msg.msgh_remote_port = a1;
  msg.uint64_t msgh_id = 65;
  *(void *)&msg.mach_port_name_t msgh_local_port = 0LL;
  return mach_msg_overwrite(&msg, 1, 0x24u, 0, 0, 0, 0, 0LL, v3);
}

uint64_t mach_notify_port_destroyed(int a1, int a2)
{
  int v5 = a2;
  int v6 = 0x100000;
  *(_DWORD *)mach_msg_header_t msg = -2147483630;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1801F7A60;
  return mach_msg_overwrite((mach_msg_header_t *)msg, 1, 0x28u, 0, 0, 0, 0, 0LL, v3);
}

uint64_t mach_notify_no_senders(mach_port_t a1, int a2)
{
  NDR_record_t v5 = NDR_record;
  int v6 = a2;
  msg.mach_msg_bits_t msgh_bits = 18;
  msg.msgh_remote_port = a1;
  msg.uint64_t msgh_id = 70;
  *(void *)&msg.mach_port_name_t msgh_local_port = 0LL;
  return mach_msg_overwrite(&msg, 1, 0x24u, 0, 0, 0, 0, 0LL, v3);
}

uint64_t mach_notify_send_once(mach_port_t a1)
{
  msg.mach_msg_bits_t msgh_bits = 18;
  msg.msgh_remote_port = a1;
  msg.mach_port_name_t msgh_local_port = 0;
  msg.uint64_t msgh_voucher_port = 0;
  msg.uint64_t msgh_id = 71;
  return mach_msg_overwrite(&msg, 1, 0x18u, 0, 0, 0, 0, 0LL, v2);
}

uint64_t mach_notify_dead_name(mach_port_t a1, int a2)
{
  NDR_record_t v5 = NDR_record;
  int v6 = a2;
  msg.mach_msg_bits_t msgh_bits = 18;
  msg.msgh_remote_port = a1;
  msg.uint64_t msgh_id = 72;
  *(void *)&msg.mach_port_name_t msgh_local_port = 0LL;
  return mach_msg_overwrite(&msg, 1, 0x24u, 0, 0, 0, 0, 0LL, v3);
}

kern_return_t processor_set_statistics( processor_set_name_t pset, processor_set_flavor_t flavor, processor_set_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  processor_set_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[32];
  BOOL v18 = NDR_record;
  mach_msg_type_number_t v7 = *info_outCnt;
  if (*info_outCnt >= 5) {
    mach_msg_type_number_t v7 = 5;
  }
  int v19 = flavor;
  int v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, pset);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xFA000000000LL;
  NDR_record_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, pset),  (void *)0xFA000000000LL,  (void *)(reply_port << 32),  (void *)0x44,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v17.msgh_id == 4100)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 61 <= 0xFFFFFFEA)
        {
          if (v17.msgh_remote_port) {
            mach_msg_header_t v12 = 1;
          }
          else {
            mach_msg_header_t v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            uint64_t v10 = v19;
          }
          else {
            uint64_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          uint64_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          uint64_t v15 = v20;
          if (v20 <= 5 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            int64_t v16 = *info_outCnt;
            if (v20 <= v16)
            {
              memmove(info_out, v21, 4LL * v20);
              uint64_t v10 = 0;
              *info_outCnt = v15;
            }

            else
            {
              memmove(info_out, v21, 4 * v16);
              *info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

kern_return_t processor_set_destroy(processor_set_t set)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, set);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xFA100000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, set),  (void *)0xFA100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int64_t v4 = -308;
    }

    else if (v7.msgh_id == 4101)
    {
      int64_t v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int64_t v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t processor_set_max_priority( processor_set_t processor_set, int max_priority, BOOLean_t change_threads)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  NDR_record_t v10;
  int v11;
  BOOLean_t v12;
  uint64_t v10 = NDR_record;
  BOOL v11 = max_priority;
  mach_msg_header_t v12 = change_threads;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xFA200000000LL;
  NDR_record_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFA200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int v6 = -308;
    }

    else if (v9.msgh_id == 4102)
    {
      int v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      int v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t processor_set_policy_enable(processor_set_t processor_set, int policy)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  int v10;
  NDR_record_t v9 = NDR_record;
  uint64_t v10 = policy;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xFA300000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFA300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  NDR_record_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      NDR_record_t v5 = -308;
    }

    else if (v8.msgh_id == 4103)
    {
      NDR_record_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        NDR_record_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      NDR_record_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t processor_set_policy_disable(processor_set_t processor_set, int policy, BOOLean_t change_threads)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  NDR_record_t v10;
  int v11;
  BOOLean_t v12;
  uint64_t v10 = NDR_record;
  BOOL v11 = policy;
  mach_msg_header_t v12 = change_threads;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xFA400000000LL;
  NDR_record_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFA400000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int v6 = -308;
    }

    else if (v9.msgh_id == 4104)
    {
      int v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int v6 = v11;
        if (!v11) {
          return v6;
        }
      }
    }

    else
    {
      int v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t processor_set_tasks( processor_set_t processor_set, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  task_t *v14;
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xFA500000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFA500000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_header_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_header_t v8 = -308;
      }

      else if (v12.msgh_id == 4105)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_header_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 529)
          {
            uint64_t v10 = v16;
            if (v16 == v17)
            {
              mach_msg_header_t v8 = 0;
              *task_list = v14;
              *task_listCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_header_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_header_t v8 = -300;
            }
            else {
              mach_msg_header_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_header_t v8 = -300;
        }
      }

      else
      {
        mach_msg_header_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t processor_set_threads( processor_set_t processor_set, thread_act_array_t *thread_list, mach_msg_type_number_t *thread_listCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  thread_act_t *v14;
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xFA600000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFA600000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_header_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        mach_msg_header_t v8 = -308;
      }

      else if (v12.msgh_id == 4106)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_header_t v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 529)
          {
            uint64_t v10 = v16;
            if (v16 == v17)
            {
              mach_msg_header_t v8 = 0;
              *thread_list = v14;
              *thread_listCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          mach_msg_header_t v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              mach_msg_header_t v8 = -300;
            }
            else {
              mach_msg_header_t v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          mach_msg_header_t v8 = -300;
        }
      }

      else
      {
        mach_msg_header_t v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t processor_set_policy_control( processor_set_t pset, processor_set_flavor_t flavor, processor_set_info_t policy_info, mach_msg_type_number_t policy_infoCnt, BOOLean_t change)
{
  kern_return_t v5;
  size_t v9;
  uint64_t reply_port;
  kern_return_t v11;
  mach_msg_header_t v13;
  NDR_record_t v14;
  processor_set_flavor_t v15;
  mach_msg_type_number_t v16;
  uint64_t v17;
  __int128 v14 = NDR_record;
  uint64_t v15 = flavor;
  if (policy_infoCnt > 5) {
    return -307;
  }
  NDR_record_t v9 = 4 * policy_infoCnt;
  memmove(&v17, policy_info, v9);
  int64_t v16 = policy_infoCnt;
  *(_DWORD *)((char *)&v13 + v9 + 40) = change;
  uint64_t reply_port = mig_get_reply_port();
  v13.mach_msg_bits_t msgh_bits = 5395;
  v13.msgh_size = v9 + 44;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, pset);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xFA700000000LL;
  BOOL v11 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)(((unint64_t)((v9 + 44) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, pset),  (void *)0xFA700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  NDR_record_t v5 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v5;
    }

    if (v13.msgh_id == 71)
    {
      NDR_record_t v5 = -308;
    }

    else if (v13.msgh_id == 4107)
    {
      NDR_record_t v5 = -300;
      if ((v13.msgh_bits & 0x80000000) == 0 && v13.msgh_size == 36 && !v13.msgh_remote_port)
      {
        NDR_record_t v5 = v15;
        if (!v15) {
          return v5;
        }
      }
    }

    else
    {
      NDR_record_t v5 = -301;
    }

    mach_msg_destroy(&v13);
  }

  return v5;
}

kern_return_t processor_set_stack_usage( processor_set_t pset, unsigned int *ltotal, vm_size_t *space, vm_size_t *resident, vm_size_t *maxusage, vm_offset_t *maxstack)
{
  kern_return_t v13;
  kern_return_t v14;
  BOOL v16;
  vm_size_t v18;
  vm_offset_t v19;
  mach_msg_header_t v20;
  kern_return_t v21;
  unsigned int v22;
  vm_size_t v23;
  vm_size_t v24;
  vm_size_t v25;
  vm_offset_t v26;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v20.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v20.msgh_remote_port = __PAIR64__(reply_port, pset);
  *(void *)&v20.uint64_t msgh_voucher_port = 0xFA800000000LL;
  NDR_record_t v13 = mach_msg2_internal( &v20,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, pset),  (void *)0xFA800000000LL,  (void *)(reply_port << 32),  (void *)0x50,  0LL);
  __int128 v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (v13)
    {
      mig_dealloc_reply_port(v20.msgh_local_port);
      return v14;
    }

    if (v20.msgh_id == 71)
    {
      __int128 v14 = -308;
    }

    else if (v20.msgh_id == 4108)
    {
      if ((v20.msgh_bits & 0x80000000) == 0)
      {
        if (v20.msgh_size == 72)
        {
          if (!v20.msgh_remote_port)
          {
            __int128 v14 = v21;
            if (!v21)
            {
              *ltotal = v22;
              BOOL v18 = v24;
              *space = v23;
              *resident = v18;
              int v19 = v26;
              *maxusage = v25;
              *maxstack = v19;
              return v14;
            }

            goto LABEL_23;
          }
        }

        else if (v20.msgh_size == 36)
        {
          if (v20.msgh_remote_port) {
            int64_t v16 = 1;
          }
          else {
            int64_t v16 = v21 == 0;
          }
          if (v16) {
            __int128 v14 = -300;
          }
          else {
            __int128 v14 = v21;
          }
          goto LABEL_23;
        }
      }

      __int128 v14 = -300;
    }

    else
    {
      __int128 v14 = -301;
    }

kern_return_t processor_set_info( processor_set_name_t set_name, int flavor, host_t *host, processor_set_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_type_number_t v14;
  size_t v15;
  uint64_t v16;
  mach_msg_header_t v18;
  NDR_record_t v19;
  int v20;
  mach_msg_type_number_t v21;
  mach_msg_size_t v22;
  _BYTE v23[28];
  int v19 = NDR_record;
  mach_msg_type_number_t v9 = *info_outCnt;
  if (*info_outCnt >= 5) {
    mach_msg_type_number_t v9 = 5;
  }
  int v20 = flavor;
  mach_msg_header_t v21 = v9;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, set_name);
  *(void *)&v18.uint64_t msgh_voucher_port = 0xFA900000000LL;
  BOOL v11 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, set_name),  (void *)0xFA900000000LL,  (void *)(reply_port << 32),  (void *)0x50,  0LL);
  mach_msg_header_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v18.msgh_local_port);
      return v12;
    }

    if (v18.msgh_id == 71)
    {
      mach_msg_header_t v12 = -308;
    }

    else if (v18.msgh_id == 4109)
    {
      if ((v18.msgh_bits & 0x80000000) != 0)
      {
        mach_msg_header_t v12 = -300;
        if (*(_DWORD *)&v19.mig_vers == 1
          && v18.msgh_size >= 0x34
          && v18.msgh_size <= 0x48
          && !v18.msgh_remote_port
          && HIWORD(v21) << 16 == 1114112)
        {
          __int128 v14 = v22;
          if (v22 <= 5 && v22 <= (v18.msgh_size - 52) >> 2)
          {
            uint64_t v15 = 4LL * v22;
            if (v18.msgh_size == 4 * v22 + 52)
            {
              *host = *(_DWORD *)&v19.int_rep;
              int64_t v16 = *info_outCnt;
              if (v14 <= v16)
              {
                memmove(info_out, v23, v15);
                mach_msg_header_t v12 = 0;
                *info_outCnt = v14;
              }

              else
              {
                memmove(info_out, v23, 4 * v16);
                *info_outCnt = v14;
                return -307;
              }

              return v12;
            }
          }
        }
      }

      else if (v18.msgh_size == 36)
      {
        mach_msg_header_t v12 = -300;
        if (v20)
        {
          if (v18.msgh_remote_port) {
            mach_msg_header_t v12 = -300;
          }
          else {
            mach_msg_header_t v12 = v20;
          }
        }
      }

      else
      {
        mach_msg_header_t v12 = -300;
      }
    }

    else
    {
      mach_msg_header_t v12 = -301;
    }

    mach_msg_destroy(&v18);
  }

  return v12;
}

kern_return_t processor_set_tasks_with_flavor( processor_set_t processor_set, mach_task_flavor_t flavor, task_array_t *task_list, mach_msg_type_number_t *task_listCnt)
{
  kern_return_t v8;
  kern_return_t v9;
  mach_msg_type_number_t v11;
  mach_msg_header_t v13;
  _BYTE v14[12];
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  *(NDR_record_t *)__int128 v14 = NDR_record;
  *(_DWORD *)&v14[8] = flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, processor_set);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xFAA00000000LL;
  mach_msg_header_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, processor_set),  (void *)0xFAA00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  mach_msg_type_number_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (v13.msgh_id == 71)
      {
        mach_msg_type_number_t v9 = -308;
      }

      else if (v13.msgh_id == 4110)
      {
        if ((v13.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v9 = -300;
          if (*(_DWORD *)v14 == 1 && *(void *)&v13.msgh_size == 56LL && v15 == 529)
          {
            BOOL v11 = v16;
            if (v16 == v17)
            {
              mach_msg_type_number_t v9 = 0;
              *task_list = *(task_array_t *)&v14[4];
              *task_listCnt = v11;
              return v9;
            }
          }
        }

        else if (v13.msgh_size == 36)
        {
          mach_msg_type_number_t v9 = -300;
          if (*(_DWORD *)&v14[8])
          {
            if (v13.msgh_remote_port) {
              mach_msg_type_number_t v9 = -300;
            }
            else {
              mach_msg_type_number_t v9 = *(_DWORD *)&v14[8];
            }
          }
        }

        else
        {
          mach_msg_type_number_t v9 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v9 = -301;
      }

      mach_msg_destroy(&v13);
      return v9;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v9;
}

kern_return_t processor_start(processor_t processor)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xBB800000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, processor),  (void *)0xBB800000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int64_t v4 = -308;
    }

    else if (v7.msgh_id == 3100)
    {
      int64_t v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int64_t v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t processor_exit(processor_t processor)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xBB900000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, processor),  (void *)0xBB900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int64_t v4 = -308;
    }

    else if (v7.msgh_id == 3101)
    {
      int64_t v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int64_t v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t processor_info( processor_t processor, processor_flavor_t flavor, host_t *host, processor_info_t processor_info_out, mach_msg_type_number_t *processor_info_outCnt)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_type_number_t v14;
  size_t v15;
  uint64_t v16;
  mach_msg_header_t v18;
  NDR_record_t v19;
  processor_flavor_t v20;
  mach_msg_type_number_t v21;
  mach_msg_size_t v22;
  _BYTE v23[92];
  int v19 = NDR_record;
  mach_msg_type_number_t v9 = *processor_info_outCnt;
  if (*processor_info_outCnt >= 0x14) {
    mach_msg_type_number_t v9 = 20;
  }
  int v20 = flavor;
  mach_msg_header_t v21 = v9;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v18.uint64_t msgh_voucher_port = 0xBBA00000000LL;
  BOOL v11 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, processor),  (void *)0xBBA00000000LL,  (void *)(reply_port << 32),  (void *)0x8C,  0LL);
  mach_msg_header_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v18.msgh_local_port);
      return v12;
    }

    if (v18.msgh_id == 71)
    {
      mach_msg_header_t v12 = -308;
    }

    else if (v18.msgh_id == 3102)
    {
      if ((v18.msgh_bits & 0x80000000) != 0)
      {
        mach_msg_header_t v12 = -300;
        if (*(_DWORD *)&v19.mig_vers == 1
          && v18.msgh_size >= 0x34
          && v18.msgh_size <= 0x84
          && !v18.msgh_remote_port
          && HIWORD(v21) << 16 == 1114112)
        {
          __int128 v14 = v22;
          if (v22 <= 0x14 && v22 <= (v18.msgh_size - 52) >> 2)
          {
            uint64_t v15 = 4LL * v22;
            if (v18.msgh_size == 4 * v22 + 52)
            {
              *host = *(_DWORD *)&v19.int_rep;
              int64_t v16 = *processor_info_outCnt;
              if (v14 <= v16)
              {
                memmove(processor_info_out, v23, v15);
                mach_msg_header_t v12 = 0;
                *processor_info_outCnt = v14;
              }

              else
              {
                memmove(processor_info_out, v23, 4 * v16);
                *processor_info_outCnt = v14;
                return -307;
              }

              return v12;
            }
          }
        }
      }

      else if (v18.msgh_size == 36)
      {
        mach_msg_header_t v12 = -300;
        if (v20)
        {
          if (v18.msgh_remote_port) {
            mach_msg_header_t v12 = -300;
          }
          else {
            mach_msg_header_t v12 = v20;
          }
        }
      }

      else
      {
        mach_msg_header_t v12 = -300;
      }
    }

    else
    {
      mach_msg_header_t v12 = -301;
    }

    mach_msg_destroy(&v18);
  }

  return v12;
}

kern_return_t processor_control( processor_t processor, processor_info_t processor_cmd, mach_msg_type_number_t processor_cmdCnt)
{
  kern_return_t v3;
  mach_msg_type_number_t v6;
  uint64_t reply_port;
  kern_return_t v8;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_msg_type_number_t v12;
  uint64_t v13;
  BOOL v11 = NDR_record;
  if (processor_cmdCnt > 0x14) {
    return -307;
  }
  int v6 = 4 * processor_cmdCnt;
  memmove(&v13, processor_cmd, 4 * processor_cmdCnt);
  mach_msg_header_t v12 = processor_cmdCnt;
  uint64_t reply_port = mig_get_reply_port();
  v10.mach_msg_bits_t msgh_bits = 5395;
  v10.msgh_size = v6 + 36;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xBBB00000000LL;
  mach_msg_header_t v8 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)(((unint64_t)((v6 + 36) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, processor),  (void *)0xBBB00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  mach_msg_size_t v3 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v3;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_size_t v3 = -308;
    }

    else if (v10.msgh_id == 3103)
    {
      mach_msg_size_t v3 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        mach_msg_size_t v3 = v12;
        if (!v12) {
          return v3;
        }
      }
    }

    else
    {
      mach_msg_size_t v3 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v3;
}

kern_return_t processor_assign(processor_t processor, processor_set_t new_set, BOOLean_t wait)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  BOOLean_t v15;
  uint64_t v10 = 1;
  BOOL v11 = new_set;
  NDR_record_t v13 = 1245184;
  __int128 v14 = NDR_record;
  uint64_t v15 = wait;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xBBC00000000LL;
  NDR_record_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, processor),  (void *)0xBBC00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int v6 = -308;
    }

    else if (v9.msgh_id == 3104)
    {
      int v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        int v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      int v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t processor_get_assignment(processor_t processor, processor_set_name_t *assigned_set)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_name_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, processor);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xBBD00000000LL;
  NDR_record_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, processor),  (void *)0xBBD00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        int v6 = -308;
      }

      else if (v9.msgh_id == 3105)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          int v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            int v6 = 0;
            *assigned_set = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          int v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              int v6 = -300;
            }
            else {
              int v6 = v12;
            }
          }
        }

        else
        {
          int v6 = -300;
        }
      }

      else
      {
        int v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t netname_check_in( mach_port_t server_port, netname_name_t port_name, mach_port_t signature, mach_port_t port_id)
{
  mach_msg_return_t v12;
  kern_return_t v13;
  mach_msg_size_t v16;
  mach_msg_header_t msg;
  int v18;
  mach_port_t v19;
  kern_return_t v20;
  int v21;
  mach_port_t v22;
  int v23;
  NDR_record_t v24;
  int v25;
  int v26;
  int v5 = 0;
  BOOL v18 = 2;
  int v19 = signature;
  mach_msg_header_t v21 = 1245184;
  int v22 = port_id;
  int v23 = 1245184;
  unsigned int v24 = NDR_record;
  BOOL v6 = port_name == 0LL;
  uint64_t v7 = 68LL;
  do
  {
    if (v6)
    {
      char v8 = 0;
      BOOL v6 = 1;
    }

    else
    {
      int v9 = *port_name++;
      char v8 = v9;
      BOOL v6 = v9 == 0;
      if (!v9) {
        int v5 = v7 - 67;
      }
    }

    *((_BYTE *)&msg.msgh_bits + v7++) = v8;
  }

  while ((_DWORD)v7 != 147);
  *((_BYTE *)&msg.msgh_bits + v7) = 0;
  if (!v6) {
    int v5 = 80;
  }
  uint64_t v25 = 0;
  uint64_t v26 = v5;
  mach_msg_size_t v10 = ((v5 + 3) & 0xFFFFFFFC) + 68;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = server_port;
  msg.mach_port_name_t msgh_local_port = reply_port;
  msg.mach_msg_bits_t msgh_bits = -2147478253;
  *(void *)&msg.uint64_t msgh_voucher_port = 0x41000000000LL;
  mach_msg_header_t v12 = mach_msg_overwrite(&msg, 3, v10, 0x2Cu, reply_port, 0, 0, 0LL, v16);
  NDR_record_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (v12)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v13;
    }

    if (msg.msgh_id == 71)
    {
      NDR_record_t v13 = -308;
    }

    else if (msg.msgh_id == 1140)
    {
      NDR_record_t v13 = -300;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        NDR_record_t v13 = v20;
        if (!v20) {
          return v13;
        }
      }
    }

    else
    {
      NDR_record_t v13 = -301;
    }

    mach_msg_destroy(&msg);
  }

  return v13;
}

kern_return_t netname_look_up( mach_port_t server_port, netname_name_t host_name, netname_name_t port_name, mach_port_t *port_id)
{
  mach_msg_return_t v21;
  kern_return_t v22;
  mach_msg_size_t v25;
  mach_msg_header_t msg;
  NDR_record_t v27;
  kern_return_t v28;
  int v29;
  _BYTE v30[168];
  int v6 = 0;
  uint64_t v27 = NDR_record;
  BOOL v7 = host_name == 0LL;
  uint64_t v8 = 40LL;
  do
  {
    if (v7)
    {
      char v9 = 0;
      BOOL v7 = 1;
    }

    else
    {
      int v10 = *host_name++;
      char v9 = v10;
      BOOL v7 = v10 == 0;
      if (!v10) {
        int v6 = v8 - 39;
      }
    }

    *((_BYTE *)&msg.msgh_bits + v8++) = v9;
  }

  while ((_DWORD)v8 != 119);
  uint64_t v11 = 0LL;
  int v12 = 0;
  *((_BYTE *)&msg.msgh_bits + v8) = 0;
  if (!v7) {
    int v6 = 80;
  }
  uint64_t v28 = 0;
  int v29 = v6;
  uint64_t v13 = (v6 + 3) & 0xFFFFFFFC;
  __int128 v14 = &v30[v13 + 8];
  BOOL v15 = port_name == 0LL;
  do
  {
    uint64_t v16 = v11 + 1;
    if (v15)
    {
      char v17 = 0;
      BOOL v15 = 1;
    }

    else
    {
      int v18 = *port_name++;
      char v17 = v18;
      BOOL v15 = v18 == 0;
      if (!v18) {
        int v12 = v11 + 1;
      }
    }

    v14[v11++] = v17;
  }

  while ((_DWORD)v16 != 79);
  if (!v15) {
    int v12 = 80;
  }
  v14[v16] = 0;
  *(_DWORD *)&v30[v13] = 0;
  *(_DWORD *)&v30[v13 + 4] = v12;
  mach_msg_size_t v19 = v13 + ((v12 + 3) & 0xFFFFFFFC) + 48;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = server_port;
  msg.mach_port_name_t msgh_local_port = reply_port;
  msg.mach_msg_bits_t msgh_bits = 5395;
  *(void *)&msg.uint64_t msgh_voucher_port = 0x41100000000LL;
  mach_msg_header_t v21 = mach_msg_overwrite(&msg, 3, v19, 0x30u, reply_port, 0, 0, 0LL, v25);
  int v22 = v21;
  if ((v21 - 268435458) > 0xE || ((1 << (v21 - 2)) & 0x4003) == 0)
  {
    if (!v21)
    {
      if (msg.msgh_id == 71)
      {
        int v22 = -308;
      }

      else if (msg.msgh_id == 1141)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          int v22 = -300;
          if (*(_DWORD *)&v27.mig_vers == 1
            && msg.msgh_size == 40
            && !msg.msgh_remote_port
            && HIWORD(v29) << 16 == 1114112)
          {
            int v22 = 0;
            *port_id = *(_DWORD *)&v27.int_rep;
            return v22;
          }
        }

        else if (msg.msgh_size == 36)
        {
          int v22 = -300;
          if (v28)
          {
            if (msg.msgh_remote_port) {
              int v22 = -300;
            }
            else {
              int v22 = v28;
            }
          }
        }

        else
        {
          int v22 = -300;
        }
      }

      else
      {
        int v22 = -301;
      }

      mach_msg_destroy(&msg);
      return v22;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v22;
}

kern_return_t netname_check_out(mach_port_t server_port, netname_name_t port_name, mach_port_t signature)
{
  mach_msg_return_t v11;
  kern_return_t v12;
  mach_msg_size_t v15;
  mach_msg_header_t msg;
  int v17;
  mach_port_t v18;
  kern_return_t v19;
  int v20;
  NDR_record_t v21;
  int v22;
  int v23;
  int v4 = 0;
  char v17 = 1;
  int v18 = signature;
  int v20 = 1245184;
  mach_msg_header_t v21 = NDR_record;
  BOOL v5 = port_name == 0LL;
  uint64_t v6 = 56LL;
  do
  {
    if (v5)
    {
      char v7 = 0;
      BOOL v5 = 1;
    }

    else
    {
      int v8 = *port_name++;
      char v7 = v8;
      BOOL v5 = v8 == 0;
      if (!v8) {
        int v4 = v6 - 55;
      }
    }

    *((_BYTE *)&msg.msgh_bits + v6++) = v7;
  }

  while ((_DWORD)v6 != 135);
  *((_BYTE *)&msg.msgh_bits + v6) = 0;
  if (!v5) {
    int v4 = 80;
  }
  int v22 = 0;
  int v23 = v4;
  mach_msg_size_t v9 = ((v4 + 3) & 0xFFFFFFFC) + 56;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = server_port;
  msg.mach_port_name_t msgh_local_port = reply_port;
  msg.mach_msg_bits_t msgh_bits = -2147478253;
  *(void *)&msg.uint64_t msgh_voucher_port = 0x41200000000LL;
  uint64_t v11 = mach_msg_overwrite(&msg, 3, v9, 0x2Cu, reply_port, 0, 0, 0LL, v15);
  int v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      int v12 = -308;
    }

    else if (msg.msgh_id == 1142)
    {
      int v12 = -300;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        int v12 = v19;
        if (!v19) {
          return v12;
        }
      }
    }

    else
    {
      int v12 = -301;
    }

    mach_msg_destroy(&msg);
  }

  return v12;
}

kern_return_t netname_version(mach_port_t server_port, netname_name_t version)
{
  mach_msg_return_t v3;
  kern_return_t v4;
  BOOL v5;
  uint64_t v8;
  int v9;
  mach_msg_size_t v10;
  mach_msg_header_t msg;
  kern_return_t v12;
  mach_msg_size_t v13;
  _BYTE v14[88];
  msg.msgh_remote_port = server_port;
  msg.mach_port_name_t msgh_local_port = mig_get_reply_port();
  msg.mach_msg_bits_t msgh_bits = 5395;
  *(void *)&msg.uint64_t msgh_voucher_port = 0x41300000000LL;
  mach_msg_size_t v3 = mach_msg_overwrite(&msg, 3, 0x18u, 0x84u, msg.msgh_local_port, 0, 0, 0LL, v10);
  int v4 = v3;
  if (v3)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v4;
  }

  if (msg.msgh_id == 71)
  {
    int v4 = -308;
LABEL_22:
    mach_msg_destroy(&msg);
    return v4;
  }

  if (msg.msgh_id != 1143)
  {
    int v4 = -301;
    goto LABEL_22;
  }

  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_21;
  }
  if (msg.msgh_size - 125 <= 0xFFFFFFAE)
  {
    if (msg.msgh_remote_port) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v12 == 0;
    }
    if (!v5 && msg.msgh_size == 36) {
      int v4 = v12;
    }
    else {
      int v4 = -300;
    }
    goto LABEL_22;
  }

  if (msg.msgh_remote_port)
  {
LABEL_21:
    int v4 = -300;
    goto LABEL_22;
  }

  int v4 = v12;
  if (v12) {
    goto LABEL_22;
  }
  int v4 = -300;
  if (v13 > 0x50 || msg.msgh_size - 44 < v13 || msg.msgh_size != ((v13 + 3) & 0xFFFFFFFC) + 44) {
    goto LABEL_22;
  }
  int v8 = 0LL;
  while (1)
  {
    mach_msg_size_t v9 = v14[v8];
    version[v8] = v9;
    if (!v9) {
      break;
    }
    if ((_DWORD)++v8 == 79)
    {
      int v4 = 0;
      version[v8] = 0;
      return v4;
    }
  }

  return 0;
}

kern_return_t task_create( task_t target_task, ledger_array_t ledgers, mach_msg_type_number_t ledgersCnt, BOOLean_t inherit_memory, task_t *child_task)
{
  kern_return_t v8;
  kern_return_t v9;
  mach_msg_header_t v11;
  int v12;
  ledger_array_t v13;
  int v14;
  mach_msg_type_number_t v15;
  NDR_record_t v16;
  mach_msg_type_number_t v17;
  BOOLean_t v18;
  int v12 = 1;
  uint64_t v13 = ledgers;
  __int128 v14 = 34799616;
  BOOL v15 = ledgersCnt;
  uint64_t v16 = NDR_record;
  char v17 = ledgersCnt;
  int v18 = inherit_memory;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD4800000000LL;
  int v8 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4800000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x30,  0LL);
  mach_msg_size_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (v11.msgh_id == 71)
      {
        mach_msg_size_t v9 = -308;
      }

      else if (v11.msgh_id == 3500)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 36)
          {
            mach_msg_size_t v9 = -300;
            if (HIDWORD(v13))
            {
              if (v11.msgh_remote_port) {
                mach_msg_size_t v9 = -300;
              }
              else {
                mach_msg_size_t v9 = HIDWORD(v13);
              }
            }
          }

          else
          {
            mach_msg_size_t v9 = -300;
          }

          goto LABEL_20;
        }

        mach_msg_size_t v9 = -300;
        if (v12 == 1 && *(void *)&v11.msgh_size == 40LL && HIWORD(v14) << 16 == 1114112)
        {
          mach_msg_size_t v9 = 0;
          *child_task = v13;
          return v9;
        }
      }

      else
      {
        mach_msg_size_t v9 = -301;
      }

kern_return_t task_terminate(task_t target_task)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xD4900000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3501)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t task_threads( task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  thread_act_t *v14;
  __int16 v15;
  mach_msg_type_number_t v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD4A00000000LL;
  char v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4A00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        int v8 = -308;
      }

      else if (v12.msgh_id == 3502)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          int v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 529)
          {
            int v10 = v16;
            if (v16 == v17)
            {
              int v8 = 0;
              *act_list = v14;
              *act_listCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          int v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              int v8 = -300;
            }
            else {
              int v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          int v8 = -300;
        }
      }

      else
      {
        int v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

uint64_t _kernelrpc_mach_ports_register3(unsigned int a1, int a2, int a3, int a4)
{
  int v11 = 3;
  int v12 = a2;
  int v14 = 1245184;
  int v15 = a3;
  int v16 = 1245184;
  int v17 = a4;
  int v18 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD4B00000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xD4B00000000LL,  (void *)((reply_port << 32) | 3),  (void *)0x2C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v10.msgh_id == 3503)
    {
      uint64_t v7 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        uint64_t v7 = v13;
        if (!v13) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_mach_ports_lookup3(unsigned int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xD4C00000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xD4C00000000LL,  (void *)(reply_port << 32),  (void *)0x48,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v14.msgh_id == 3504)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if (v15 == 3
            && v14.msgh_size == 64
            && !v14.msgh_remote_port
            && v18 << 16 == 1114112
            && v20 << 16 == 1114112
            && v22 << 16 == 1114112)
          {
            uint64_t v10 = 0LL;
            int v12 = v19;
            *a2 = v16;
            *a3 = v12;
            *a4 = v21;
            return v10;
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (v17)
          {
            if (v14.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = v17;
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

kern_return_t task_info( task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  task_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[384];
  unsigned __int16 v18 = NDR_record;
  mach_msg_type_number_t v7 = *task_info_outCnt;
  if (*task_info_outCnt >= 0x5E) {
    mach_msg_type_number_t v7 = 94;
  }
  int v19 = flavor;
  unsigned __int16 v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xD4D00000000LL;
  int64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4D00000000LL,  (void *)(reply_port << 32),  (void *)0x1A8,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v17.msgh_id == 3505)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 417 <= 0xFFFFFE86)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            uint64_t v10 = v19;
          }
          else {
            uint64_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          uint64_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 0x5E && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            int v16 = *task_info_outCnt;
            if (v20 <= v16)
            {
              memmove(task_info_out, v21, 4LL * v20);
              uint64_t v10 = 0;
              *task_info_outCnt = v15;
            }

            else
            {
              memmove(task_info_out, v21, 4 * v16);
              *task_info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

kern_return_t task_set_info( task_t target_task, task_flavor_t flavor, task_info_t task_info_in, mach_msg_type_number_t task_info_inCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  task_flavor_t v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  int v12 = NDR_record;
  unsigned int v13 = flavor;
  if (task_info_inCnt > 0x5E) {
    return -307;
  }
  mach_msg_type_number_t v7 = 4 * task_info_inCnt;
  memmove(&v15, task_info_in, 4 * task_info_inCnt);
  mach_msg_header_t v14 = task_info_inCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD4E00000000LL;
  int64_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4E00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v11.msgh_id == 3506)
    {
      int v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t task_suspend(task_t target_task)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xD4F00000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD4F00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3507)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t task_resume(task_t target_task)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xD5000000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD5000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3508)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  int v12;
  unsigned __int16 v13;
  int v11 = NDR_record;
  int v12 = which_port;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD5100000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5100000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        mach_msg_type_number_t v7 = -308;
      }

      else if (v10.msgh_id == 3509)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            mach_msg_type_number_t v7 = 0;
            *special_port = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          mach_msg_type_number_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              mach_msg_type_number_t v7 = -300;
            }
            else {
              mach_msg_type_number_t v7 = v12;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v7 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  mach_port_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  int v15;
  uint64_t v10 = 1;
  int v11 = special_port;
  unsigned int v13 = 1245184;
  mach_msg_header_t v14 = NDR_record;
  int v15 = which_port;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD5200000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5200000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3510)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        int64_t v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t thread_create(task_t parent_task, thread_act_t *child_act)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  thread_act_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, parent_task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD5300000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, parent_task),  (void *)0xD5300000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        int64_t v6 = -308;
      }

      else if (v9.msgh_id == 3511)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          int64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            int64_t v6 = 0;
            *child_act = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          int64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              int64_t v6 = -300;
            }
            else {
              int64_t v6 = v12;
            }
          }
        }

        else
        {
          int64_t v6 = -300;
        }
      }

      else
      {
        int64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t thread_create_running( task_t parent_task, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt, thread_act_t *child_act)
{
  kern_return_t v5;
  mach_msg_type_number_t v9;
  uint64_t reply_port;
  kern_return_t v11;
  mach_msg_header_t v13;
  NDR_record_t v14;
  thread_state_flavor_t v15;
  mach_msg_type_number_t v16;
  uint64_t v17;
  mach_msg_header_t v14 = NDR_record;
  int v15 = flavor;
  if (new_stateCnt > 0x510) {
    return -307;
  }
  int64_t v9 = 4 * new_stateCnt;
  memmove(&v17, new_state, 4 * new_stateCnt);
  int v16 = new_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v13.mach_msg_bits_t msgh_bits = 5395;
  v13.msgh_size = v9 + 40;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, parent_task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xD5400000000LL;
  int v11 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)(((unint64_t)((v9 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, parent_task),  (void *)0xD5400000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  BOOL v5 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v13.msgh_id == 71)
      {
        BOOL v5 = -308;
      }

      else if (v13.msgh_id == 3512)
      {
        if ((v13.msgh_bits & 0x80000000) != 0)
        {
          BOOL v5 = -300;
          if (*(_DWORD *)&v14.mig_vers == 1
            && v13.msgh_size == 40
            && !v13.msgh_remote_port
            && HIWORD(v16) << 16 == 1114112)
          {
            BOOL v5 = 0;
            *child_act = *(_DWORD *)&v14.int_rep;
            return v5;
          }
        }

        else if (v13.msgh_size == 36)
        {
          BOOL v5 = -300;
          if (v15)
          {
            if (v13.msgh_remote_port) {
              BOOL v5 = -300;
            }
            else {
              BOOL v5 = v15;
            }
          }
        }

        else
        {
          BOOL v5 = -300;
        }
      }

      else
      {
        BOOL v5 = -301;
      }

      mach_msg_destroy(&v13);
      return v5;
    }

    mig_dealloc_reply_port(v13.msgh_local_port);
  }

  return v5;
}

kern_return_t task_set_exception_ports( task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  int v11;
  mach_port_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  exception_mask_t v16;
  exception_behavior_t v17;
  thread_state_flavor_t v18;
  int v11 = 1;
  int v12 = new_port;
  mach_msg_header_t v14 = 1245184;
  int v15 = NDR_record;
  int v16 = exception_mask;
  unsigned int v17 = behavior;
  unsigned __int16 v18 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD5500000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      int v8 = -308;
    }

    else if (v10.msgh_id == 3513)
    {
      int v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        int v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      int v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t task_get_exception_ports( task_inspect_t task, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v14;
  kern_return_t v15;
  unsigned __int8 *p_int_rep;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  NDR_record_t v28;
  exception_mask_t v29;
  mach_msg_size_t v30;
  uint64_t v31;
  uint64_t v28 = NDR_record;
  int v29 = exception_mask;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v27.uint64_t msgh_voucher_port = 0xD5600000000LL;
  mach_msg_header_t v14 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5600000000LL,  (void *)(reply_port << 32),  (void *)0x330,  0LL);
  int v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v27.msgh_local_port);
      return v15;
    }

    if (v27.msgh_id == 71)
    {
      int v15 = -308;
    }

    else if (v27.msgh_id == 3514)
    {
      if ((v27.msgh_bits & 0x80000000) != 0)
      {
        int v15 = -300;
        if (*(_DWORD *)&v28.mig_vers != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
          goto LABEL_27;
        }
        p_int_rep = &v28.int_rep;
        unsigned __int16 v18 = 36LL;
        while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
        {
          v18 += 12LL;
          if ((_DWORD)v18 == 420)
          {
            int v19 = v30;
            if (v30 > 0x20) {
              break;
            }
            int v15 = -300;
            if (v30 <= (v27.msgh_size - 424) >> 2)
            {
              int v21 = 4 * v30;
              unsigned __int16 v22 = v21 + 424;
              if (v27.msgh_size >= (v21 + 424))
              {
                int v23 = v27.msgh_size - v21;
                if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v30)
                {
                  unsigned int v24 = v23 - v21;
                  if (v24 == v22 && (v24 - 424) >> 2 >= v30)
                  {
                    uint64_t v25 = (char *)&v27 + v21 - 128;
                    memmove(masks, &v31, 4 * v30);
                    *masksCnt = v19;
                    if ((_DWORD)v19)
                    {
                      do
                      {
                        uint64_t v26 = *(_DWORD *)p_int_rep;
                        p_int_rep += 12;
                        *old_handlers++ = v26;
                        --v19;
                      }

                      while (v19);
                    }

                    memmove(old_behaviors, v25 + 552, v21);
                    memmove(old_flavors, &v25[v21 + 552], v21);
                    return 0;
                  }
                }
              }
            }

            goto LABEL_27;
          }
        }
      }

      else if (v27.msgh_size == 36)
      {
        int v15 = -300;
        if (v29)
        {
          if (v27.msgh_remote_port) {
            int v15 = -300;
          }
          else {
            int v15 = v29;
          }
        }

        goto LABEL_27;
      }

      int v15 = -300;
    }

    else
    {
      int v15 = -301;
    }

kern_return_t task_swap_exception_ports( task_t task, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlerss, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v15;
  kern_return_t v16;
  exception_handler_t *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  int v28;
  mach_port_t v29;
  kern_return_t v30;
  int v31;
  NDR_record_t v32;
  exception_mask_t v33;
  exception_behavior_t v34;
  thread_state_flavor_t v35;
  mach_msg_size_t v36;
  uint64_t v37;
  uint64_t v28 = 1;
  int v29 = new_port;
  int v31 = 1245184;
  int v32 = NDR_record;
  int v33 = exception_mask;
  int v34 = behavior;
  __int128 v35 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v27.uint64_t msgh_voucher_port = 0xD5700000000LL;
  int v15 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5700000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x330,  0LL);
  int v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (v27.msgh_id == 71)
      {
        int v16 = -308;
      }

      else if (v27.msgh_id == 3515)
      {
        if ((v27.msgh_bits & 0x80000000) != 0)
        {
          int v16 = -300;
          if (v28 != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
            goto LABEL_24;
          }
          unsigned int v17 = &v29;
          unsigned __int16 v18 = 36LL;
          while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
          {
            v18 += 12LL;
            if ((_DWORD)v18 == 420)
            {
              int v19 = v36;
              if (v36 > 0x20) {
                break;
              }
              int v16 = -300;
              if (v36 <= (v27.msgh_size - 424) >> 2)
              {
                int v21 = 4 * v36;
                unsigned __int16 v22 = v21 + 424;
                if (v27.msgh_size >= (v21 + 424))
                {
                  int v23 = v27.msgh_size - v21;
                  if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v36)
                  {
                    unsigned int v24 = v23 - v21;
                    if (v24 == v22 && (v24 - 424) >> 2 >= v36)
                    {
                      uint64_t v25 = (char *)&v27 + v21 - 128;
                      memmove(masks, &v37, 4 * v36);
                      *masksCnt = v19;
                      if ((_DWORD)v19)
                      {
                        do
                        {
                          uint64_t v26 = *v17;
                          v17 += 3;
                          *old_handlerss++ = v26;
                          --v19;
                        }

                        while (v19);
                      }

                      memmove(old_behaviors, v25 + 552, v21);
                      memmove(old_flavors, &v25[v21 + 552], v21);
                      return 0;
                    }
                  }
                }
              }

              goto LABEL_24;
            }
          }
        }

        else if (v27.msgh_size == 36)
        {
          int v16 = -300;
          if (v30)
          {
            if (v27.msgh_remote_port) {
              int v16 = -300;
            }
            else {
              int v16 = v30;
            }
          }

          goto LABEL_24;
        }

        int v16 = -300;
      }

      else
      {
        int v16 = -301;
      }

kern_return_t lock_set_create(task_t task, lock_set_t *new_lock_set, int n_ulocks, int policy)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  NDR_record_t v12;
  int v13;
  int v14;
  int v12 = NDR_record;
  unsigned int v13 = n_ulocks;
  mach_msg_header_t v14 = policy;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD5800000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5800000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        int v8 = -308;
      }

      else if (v11.msgh_id == 3516)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          int v8 = -300;
          if (*(_DWORD *)&v12.mig_vers == 1 && *(void *)&v11.msgh_size == 40LL && HIWORD(v14) << 16 == 1114112)
          {
            int v8 = 0;
            *new_lock_set = *(_DWORD *)&v12.int_rep;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          int v8 = -300;
          if (v13)
          {
            if (v11.msgh_remote_port) {
              int v8 = -300;
            }
            else {
              int v8 = v13;
            }
          }
        }

        else
        {
          int v8 = -300;
        }
      }

      else
      {
        int v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t lock_set_destroy(task_t task, lock_set_t lock_set)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  lock_set_t v10;
  kern_return_t v11;
  int v12;
  int64_t v9 = 1;
  uint64_t v10 = lock_set;
  int v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD5900000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5900000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  BOOL v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      BOOL v5 = -308;
    }

    else if (v8.msgh_id == 3517)
    {
      BOOL v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        BOOL v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      BOOL v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  NDR_record_t v12;
  int v13;
  int v14;
  int v12 = NDR_record;
  unsigned int v13 = policy;
  mach_msg_header_t v14 = value;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD5A00000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5A00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        int v8 = -308;
      }

      else if (v11.msgh_id == 3518)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          int v8 = -300;
          if (*(_DWORD *)&v12.mig_vers == 1 && *(void *)&v11.msgh_size == 40LL && HIWORD(v14) << 16 == 1114112)
          {
            int v8 = 0;
            *semaphore = *(_DWORD *)&v12.int_rep;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          int v8 = -300;
          if (v13)
          {
            if (v11.msgh_remote_port) {
              int v8 = -300;
            }
            else {
              int v8 = v13;
            }
          }
        }

        else
        {
          int v8 = -300;
        }
      }

      else
      {
        int v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  semaphore_t v10;
  kern_return_t v11;
  int v12;
  int64_t v9 = 1;
  uint64_t v10 = semaphore;
  int v12 = 1114112;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD5B00000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5B00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  BOOL v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      BOOL v5 = -308;
    }

    else if (v8.msgh_id == 3519)
    {
      BOOL v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        BOOL v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      BOOL v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_policy_set( task_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  task_policy_flavor_t v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  int v12 = NDR_record;
  unsigned int v13 = flavor;
  if (policy_infoCnt > 0x10) {
    return -307;
  }
  mach_msg_type_number_t v7 = 4 * policy_infoCnt;
  memmove(&v15, policy_info, 4 * policy_infoCnt);
  mach_msg_header_t v14 = policy_infoCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD5C00000000LL;
  int64_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, task),  (void *)0xD5C00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v11.msgh_id == 3520)
    {
      int v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t task_policy_get( task_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  kern_return_t v11;
  kern_return_t v12;
  BOOL v14;
  mach_msg_type_number_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  mach_msg_header_t v21;
  NDR_record_t v22;
  task_policy_flavor_t v23;
  mach_msg_size_t v24;
  _DWORD v25[20];
  unsigned __int16 v22 = NDR_record;
  mach_msg_type_number_t v9 = *policy_infoCnt;
  if (*policy_infoCnt >= 0x10) {
    mach_msg_type_number_t v9 = 16;
  }
  int v23 = flavor;
  unsigned int v24 = v9;
  v25[0] = *get_default;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v21.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v21.uint64_t msgh_voucher_port = 0xD5D00000000LL;
  int v11 = mach_msg2_internal( &v21,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5D00000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  int v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v21.msgh_local_port);
      return v12;
    }

    if (v21.msgh_id == 71)
    {
      int v12 = -308;
    }

    else if (v21.msgh_id == 3521)
    {
      if ((v21.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v21.msgh_size - 109 <= 0xFFFFFFBE)
      {
        if (v21.msgh_remote_port) {
          mach_msg_header_t v14 = 1;
        }
        else {
          mach_msg_header_t v14 = v23 == 0;
        }
        if (!v14 && v21.msgh_size == 36) {
          int v12 = v23;
        }
        else {
          int v12 = -300;
        }
        goto LABEL_27;
      }

      if (v21.msgh_remote_port) {
        goto LABEL_26;
      }
      int v12 = v23;
      if (v23) {
        goto LABEL_27;
      }
      unsigned int v17 = v24;
      if (v24 > 0x10)
      {
LABEL_26:
        int v12 = -300;
      }

      else
      {
        int v12 = -300;
        if (v24 <= (v21.msgh_size - 44) >> 2)
        {
          unsigned __int16 v18 = 4 * v24;
          if (v21.msgh_size == (_DWORD)v18 + 44)
          {
            int v19 = *policy_infoCnt;
            if (v24 <= v19)
            {
              unsigned __int16 v20 = (char *)&v21 + v18;
              memmove(policy_info, v25, v18);
              int v12 = 0;
              *policy_infoCnt = v17;
              *get_default = *((_DWORD *)v20 + 10);
            }

            else
            {
              memmove(policy_info, v25, 4 * v19);
              *policy_infoCnt = v17;
              return -307;
            }

            return v12;
          }
        }
      }
    }

    else
    {
      int v12 = -301;
    }

kern_return_t task_sample(task_t task, mach_port_t reply)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  mach_port_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  uint64_t v10 = reply;
  int v12 = 1310720;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD5E00000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD5E00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  BOOL v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      BOOL v5 = -308;
    }

    else if (v8.msgh_id == 3522)
    {
      BOOL v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        BOOL v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      BOOL v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_policy( task_t task, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, BOOLean_t set_limit, BOOLean_t change)
{
  kern_return_t v6;
  size_t v11;
  char *v12;
  uint64_t reply_port;
  kern_return_t v14;
  mach_msg_header_t v16;
  NDR_record_t v17;
  policy_t v18;
  mach_msg_type_number_t v19;
  int v20;
  unsigned int v17 = NDR_record;
  unsigned __int16 v18 = policy;
  if (baseCnt > 5) {
    return -307;
  }
  int v11 = 4 * baseCnt;
  memmove(&v20, base, v11);
  int v19 = baseCnt;
  int v12 = (char *)&v16 + v11;
  *((_DWORD *)v12 + 10) = set_limit;
  *((_DWORD *)v12 + 11) = change;
  uint64_t reply_port = mig_get_reply_port();
  v16.mach_msg_bits_t msgh_bits = 5395;
  v16.msgh_size = v11 + 48;
  *(void *)&v16.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v16.uint64_t msgh_voucher_port = 0xD5F00000000LL;
  mach_msg_header_t v14 = mach_msg2_internal( &v16,  0x200000003uLL,  (void *)(((unint64_t)((v11 + 48) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, task),  (void *)0xD5F00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v6 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v6;
    }

    if (v16.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v16.msgh_id == 3523)
    {
      int64_t v6 = -300;
      if ((v16.msgh_bits & 0x80000000) == 0 && v16.msgh_size == 36 && !v16.msgh_remote_port)
      {
        int64_t v6 = v18;
        if (!v18) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v16);
  }

  return v6;
}

kern_return_t task_set_emulation(task_t target_port, vm_address_t routine_entry_pt, int routine_number)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  NDR_record_t v10;
  vm_address_t v11;
  int v12;
  uint64_t v10 = NDR_record;
  int v11 = routine_entry_pt;
  int v12 = routine_number;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, target_port);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6000000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, target_port),  (void *)0xD6000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3524)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int64_t v6 = v11;
        if (!(_DWORD)v11) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t task_get_emulation_vector( task_t task, int *vector_start, emulation_vector_t *emulation_vector, mach_msg_type_number_t *emulation_vectorCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  mach_msg_type_number_t v12;
  mach_msg_header_t v14;
  int v15;
  mach_vm_offset_t *v16;
  char v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xD6100000000LL;
  mach_msg_type_number_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6100000000LL,  (void *)(reply_port << 32),  (void *)0x44,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = -308;
      }

      else if (v14.msgh_id == 3525)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = -300;
          if (v15 == 1 && v14.msgh_size == 60 && !v14.msgh_remote_port && v17 == 1)
          {
            int v12 = v18 >> 3;
            if (v18 >> 3 == v20)
            {
              uint64_t v10 = 0;
              *vector_start = v19;
              *emulation_vector = v16;
              *emulation_vectorCnt = v12;
              return v10;
            }
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v10 = -300;
          if (HIDWORD(v16))
          {
            if (v14.msgh_remote_port) {
              uint64_t v10 = -300;
            }
            else {
              uint64_t v10 = HIDWORD(v16);
            }
          }
        }

        else
        {
          uint64_t v10 = -300;
        }
      }

      else
      {
        uint64_t v10 = -301;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

kern_return_t task_set_emulation_vector( task_t task, int vector_start, emulation_vector_t emulation_vector, mach_msg_type_number_t emulation_vectorCnt)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v9;
  int v10;
  emulation_vector_t v11;
  int v12;
  mach_msg_type_number_t v13;
  NDR_record_t v14;
  int v15;
  mach_msg_type_number_t v16;
  uint64_t v10 = 1;
  int v11 = emulation_vector;
  int v12 = 16777472;
  unsigned int v13 = 8 * emulation_vectorCnt;
  mach_msg_header_t v14 = NDR_record;
  int v15 = vector_start;
  int v16 = emulation_vectorCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6200000000LL;
  int64_t v6 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6200000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v7;
    }

    if (v9.msgh_id == 71)
    {
      mach_msg_type_number_t v7 = -308;
    }

    else if (v9.msgh_id == 3526)
    {
      mach_msg_type_number_t v7 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        mach_msg_type_number_t v7 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v7;
        }
      }
    }

    else
    {
      mach_msg_type_number_t v7 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v7;
}

kern_return_t task_set_ras_pc(task_t target_task, vm_address_t basepc, vm_address_t boundspc)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  NDR_record_t v10;
  vm_address_t v11;
  vm_address_t v12;
  uint64_t v10 = NDR_record;
  int v11 = basepc;
  int v12 = boundspc;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6300000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD6300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3527)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int64_t v6 = v11;
        if (!(_DWORD)v11) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t task_zone_info( task_t target_task, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, task_zone_info_array_t *info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_type_number_t v14;
  mach_msg_type_number_t v15;
  mach_msg_header_t v17;
  int v18;
  mach_zone_name_t *v19;
  char v20;
  unsigned int v21;
  task_zone_info_t *v22;
  char v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xD6400000000LL;
  int v11 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD6400000000LL,  (void *)(reply_port << 32),  (void *)0x54,  0LL);
  int v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v17.msgh_id == 71)
      {
        int v12 = -308;
      }

      else if (v17.msgh_id == 3528)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          int v12 = -300;
          if (v18 == 2 && v17.msgh_size == 76 && !v17.msgh_remote_port && v20 == 1 && v23 == 1)
          {
            mach_msg_header_t v14 = v21 / 0x50;
            if (v21 / 0x50 == v25)
            {
              int v15 = v24 / 0x58;
              if (v24 / 0x58 == v26)
              {
                int v12 = 0;
                *names = v19;
                *namesCnt = v14;
                *uint64_t info = v22;
                *infoCnt = v15;
                return v12;
              }
            }
          }
        }

        else if (v17.msgh_size == 36)
        {
          int v12 = -300;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              int v12 = -300;
            }
            else {
              int v12 = HIDWORD(v19);
            }
          }
        }

        else
        {
          int v12 = -300;
        }
      }

      else
      {
        int v12 = -301;
      }

      mach_msg_destroy(&v17);
      return v12;
    }

    mig_dealloc_reply_port(v17.msgh_local_port);
  }

  return v12;
}

kern_return_t task_assign(task_t task, processor_set_t new_set, BOOLean_t assign_threads)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  BOOLean_t v15;
  uint64_t v10 = 1;
  int v11 = new_set;
  unsigned int v13 = 1245184;
  mach_msg_header_t v14 = NDR_record;
  int v15 = assign_threads;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6500000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3529)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        int64_t v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t task_assign_default(task_t task, BOOLean_t assign_threads)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  BOOLean_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  uint64_t v10 = assign_threads;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD6600000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  BOOL v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      BOOL v5 = -308;
    }

    else if (v8.msgh_id == 3530)
    {
      BOOL v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        BOOL v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      BOOL v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_get_assignment(task_t task, processor_set_name_t *assigned_set)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_name_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6700000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6700000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        int64_t v6 = -308;
      }

      else if (v9.msgh_id == 3531)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          int64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            int64_t v6 = 0;
            *assigned_set = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          int64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              int64_t v6 = -300;
            }
            else {
              int64_t v6 = v12;
            }
          }
        }

        else
        {
          int64_t v6 = -300;
        }
      }

      else
      {
        int64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t task_set_policy( task_t task, processor_set_t pset, policy_t policy, policy_base_t base, mach_msg_type_number_t baseCnt, policy_limit_t limit, mach_msg_type_number_t limitCnt, BOOLean_t change)
{
  kern_return_t v14;
  size_t v16;
  char *v17;
  uint64_t reply_port;
  kern_return_t v19;
  mach_msg_header_t v20;
  unsigned int v21;
  processor_set_t v22;
  kern_return_t v23;
  int v24;
  NDR_record_t v25;
  policy_t v26;
  mach_msg_type_number_t v27;
  uint64_t v28;
  int v21 = 1;
  unsigned __int16 v22 = pset;
  unsigned int v24 = 1245184;
  uint64_t v25 = NDR_record;
  uint64_t v26 = policy;
  if (baseCnt > 5) {
    return -307;
  }
  size_t v13 = 4 * baseCnt;
  memmove(&v28, base, v13);
  uint64_t v27 = baseCnt;
  if (limitCnt > 1) {
    return -307;
  }
  int v16 = 4 * limitCnt;
  unsigned int v17 = (char *)&v20 + v13 + v16;
  memmove((char *)&v20 + v13 + 60, limit, v16);
  *(_DWORD *)((char *)&v20 + v13 + 56) = limitCnt;
  *((_DWORD *)v17 + 15) = change;
  uint64_t reply_port = mig_get_reply_port();
  v20.mach_msg_bits_t msgh_bits = -2147478253;
  v20.msgh_size = v13 + 4 * limitCnt + 64;
  *(void *)&v20.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v20.uint64_t msgh_voucher_port = 0xD6800000000LL;
  int v19 = mach_msg2_internal( &v20,  0x200000003uLL,  (void *)(((unint64_t)v20.msgh_size << 32) | 0x80001513),  (void *)__PAIR64__(reply_port, task),  (void *)0xD6800000000LL,  (void *)(v21 | (unint64_t)(reply_port << 32)),  (void *)0x2C,  0LL);
  mach_msg_header_t v14 = v19;
  if ((v19 - 268435458) > 0xE || ((1 << (v19 - 2)) & 0x4003) == 0)
  {
    if (v19)
    {
      mig_dealloc_reply_port(v20.msgh_local_port);
      return v14;
    }

    if (v20.msgh_id == 71)
    {
      mach_msg_header_t v14 = -308;
    }

    else if (v20.msgh_id == 3532)
    {
      mach_msg_header_t v14 = -300;
      if ((v20.msgh_bits & 0x80000000) == 0 && v20.msgh_size == 36 && !v20.msgh_remote_port)
      {
        mach_msg_header_t v14 = v23;
        if (!v23) {
          return v14;
        }
      }
    }

    else
    {
      mach_msg_header_t v14 = -301;
    }

    mach_msg_destroy(&v20);
  }

  return v14;
}

kern_return_t task_get_state( task_t task, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  thread_state_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[5192];
  unsigned __int16 v18 = NDR_record;
  mach_msg_type_number_t v7 = *old_stateCnt;
  if (*old_stateCnt >= 0x510) {
    mach_msg_type_number_t v7 = 1296;
  }
  int v19 = flavor;
  unsigned __int16 v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xD6900000000LL;
  mach_msg_type_number_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6900000000LL,  (void *)(reply_port << 32),  (void *)0x1470,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v17.msgh_id == 3533)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 5225 <= 0xFFFFEBBE)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            uint64_t v10 = v19;
          }
          else {
            uint64_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          uint64_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 0x510 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            int v16 = *old_stateCnt;
            if (v20 <= v16)
            {
              memmove(old_state, v21, 4LL * v20);
              uint64_t v10 = 0;
              *old_stateCnt = v15;
            }

            else
            {
              memmove(old_state, v21, 4 * v16);
              *old_stateCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

kern_return_t task_set_state( task_t task, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  thread_state_flavor_t v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  int v12 = NDR_record;
  size_t v13 = flavor;
  if (new_stateCnt > 0x510) {
    return -307;
  }
  mach_msg_type_number_t v7 = 4 * new_stateCnt;
  memmove(&v15, new_state, 4 * new_stateCnt);
  mach_msg_header_t v14 = new_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD6A00000000LL;
  mach_msg_type_number_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, task),  (void *)0xD6A00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v11.msgh_id == 3534)
    {
      int v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t task_set_phys_footprint_limit(task_t task, int new_limit, int *old_limit)
{
  kern_return_t v6;
  kern_return_t v7;
  BOOL v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  int v13;
  int v14;
  int v12 = NDR_record;
  size_t v13 = new_limit;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD6B00000000LL;
  int64_t v6 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6B00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v7;
    }

    if (v11.msgh_id == 71)
    {
      mach_msg_type_number_t v7 = -308;
    }

    else if (v11.msgh_id == 3535)
    {
      if ((v11.msgh_bits & 0x80000000) == 0)
      {
        if (v11.msgh_size == 40)
        {
          if (!v11.msgh_remote_port)
          {
            mach_msg_type_number_t v7 = v13;
            if (!v13)
            {
              *old_limit = v14;
              return v7;
            }

            goto LABEL_23;
          }
        }

        else if (v11.msgh_size == 36)
        {
          if (v11.msgh_remote_port) {
            mach_msg_type_number_t v9 = 1;
          }
          else {
            mach_msg_type_number_t v9 = v13 == 0;
          }
          if (v9) {
            mach_msg_type_number_t v7 = -300;
          }
          else {
            mach_msg_type_number_t v7 = v13;
          }
          goto LABEL_23;
        }
      }

      mach_msg_type_number_t v7 = -300;
    }

    else
    {
      mach_msg_type_number_t v7 = -301;
    }

kern_return_t task_suspend2(task_t target_task, task_suspension_token_t *suspend_token)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  task_suspension_token_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD6C00000000LL;
  BOOL v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD6C00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        int64_t v6 = -308;
      }

      else if (v9.msgh_id == 3536)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          int64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1179648)
          {
            int64_t v6 = 0;
            *suspend_token = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          int64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              int64_t v6 = -300;
            }
            else {
              int64_t v6 = v12;
            }
          }
        }

        else
        {
          int64_t v6 = -300;
        }
      }

      else
      {
        int64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t task_resume2(task_suspension_token_t suspend_token)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001512LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, suspend_token);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xD6D00000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001512LL,  (void *)__PAIR64__(reply_port, suspend_token),  (void *)0xD6D00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3537)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t task_purgable_info(task_t task, task_purgable_info_t *stats)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  mach_msg_header_t v10;
  kern_return_t v11;
  int v12;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD6E00000000LL;
  BOOL v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6E00000000LL,  (void *)(reply_port << 32),  (void *)0x13C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v10.msgh_id == 3538)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 308)
        {
          if (!v10.msgh_remote_port)
          {
            int64_t v6 = v11;
            if (!v11)
            {
              memmove(stats, &v12, 0x110uLL);
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            int v8 = 1;
          }
          else {
            int v8 = v11 == 0;
          }
          if (v8) {
            int64_t v6 = -300;
          }
          else {
            int64_t v6 = v11;
          }
          goto LABEL_23;
        }
      }

      int64_t v6 = -300;
    }

    else
    {
      int64_t v6 = -301;
    }

kern_return_t task_get_mach_voucher(task_t task, mach_voucher_selector_t which, ipc_voucher_t *voucher)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_voucher_selector_t v12;
  unsigned __int16 v13;
  int v11 = NDR_record;
  int v12 = which;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD6F00000000LL;
  int64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD6F00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        mach_msg_type_number_t v7 = -308;
      }

      else if (v10.msgh_id == 3539)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            mach_msg_type_number_t v7 = 0;
            *voucher = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          mach_msg_type_number_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              mach_msg_type_number_t v7 = -300;
            }
            else {
              mach_msg_type_number_t v7 = v12;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v7 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t task_set_mach_voucher(task_t task, ipc_voucher_t voucher)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  ipc_voucher_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  uint64_t v10 = voucher;
  int v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD7000000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7000000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  BOOL v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      BOOL v5 = -308;
    }

    else if (v8.msgh_id == 3540)
    {
      BOOL v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        BOOL v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      BOOL v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_swap_mach_voucher(task_t task, ipc_voucher_t new_voucher, ipc_voucher_t *old_voucher)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  int v12;
  ipc_voucher_t v13;
  kern_return_t v14;
  int v15;
  ipc_voucher_t v16;
  int v17;
  int v12 = 2;
  size_t v13 = new_voucher;
  ipc_voucher_t v5 = *old_voucher;
  int v15 = 1245184;
  int v16 = v5;
  unsigned int v17 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD7100000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7100000000LL,  (void *)((reply_port << 32) | 2),  (void *)0x30,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        int v8 = -308;
      }

      else if (v11.msgh_id == 3541)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          int v8 = -300;
          if (v12 == 1 && v11.msgh_size == 40 && !v11.msgh_remote_port && HIWORD(v15) << 16 == 1114112)
          {
            int v8 = 0;
            *old_voucher = v13;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          int v8 = -300;
          if (v14)
          {
            if (v11.msgh_remote_port) {
              int v8 = -300;
            }
            else {
              int v8 = v14;
            }
          }
        }

        else
        {
          int v8 = -300;
        }
      }

      else
      {
        int v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t task_generate_corpse(task_t task, mach_port_t *corpse_task_port)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  mach_port_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD7200000000LL;
  ipc_voucher_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7200000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        int64_t v6 = -308;
      }

      else if (v9.msgh_id == 3542)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          int64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            int64_t v6 = 0;
            *corpse_task_port = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          int64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              int64_t v6 = -300;
            }
            else {
              int64_t v6 = v12;
            }
          }
        }

        else
        {
          int64_t v6 = -300;
        }
      }

      else
      {
        int64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t task_map_corpse_info( task_t task, task_t corspe_task, vm_address_t *kcd_addr_begin, uint32_t *kcd_size)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  task_t v15;
  kern_return_t v16;
  vm_address_t v17;
  uint32_t v18;
  mach_msg_header_t v14 = 1;
  int v15 = corspe_task;
  LODWORD(v17) = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xD7300000000LL;
  int v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7300000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x38,  0LL);
  mach_msg_type_number_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      mach_msg_type_number_t v9 = -308;
    }

    else if (v13.msgh_id == 3543)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 48)
        {
          if (!v13.msgh_remote_port)
          {
            mach_msg_type_number_t v9 = v16;
            if (!v16)
            {
              *kcd_addr_begin = v17;
              *kcd_size = v18;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            int v11 = 1;
          }
          else {
            int v11 = v16 == 0;
          }
          if (v11) {
            mach_msg_type_number_t v9 = -300;
          }
          else {
            mach_msg_type_number_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      mach_msg_type_number_t v9 = -300;
    }

    else
    {
      mach_msg_type_number_t v9 = -301;
    }

kern_return_t task_register_dyld_image_infos( task_t task, dyld_kernel_image_info_array_t dyld_images, mach_msg_type_number_t dyld_imagesCnt)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  dyld_kernel_image_info_array_t v11;
  int v12;
  mach_msg_type_number_t v13;
  NDR_record_t v14;
  mach_msg_type_number_t v15;
  uint64_t v10 = 1;
  int v11 = dyld_images;
  int v12 = 16777472;
  size_t v13 = 40 * dyld_imagesCnt;
  mach_msg_header_t v14 = NDR_record;
  int v15 = dyld_imagesCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3880001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD7400000000LL;
  ipc_voucher_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7400000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3544)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        int64_t v6 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t task_unregister_dyld_image_infos( task_t task, dyld_kernel_image_info_array_t dyld_images, mach_msg_type_number_t dyld_imagesCnt)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  dyld_kernel_image_info_array_t v11;
  int v12;
  mach_msg_type_number_t v13;
  NDR_record_t v14;
  mach_msg_type_number_t v15;
  uint64_t v10 = 1;
  int v11 = dyld_images;
  int v12 = 16777472;
  size_t v13 = 40 * dyld_imagesCnt;
  mach_msg_header_t v14 = NDR_record;
  int v15 = dyld_imagesCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3880001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD7500000000LL;
  ipc_voucher_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v9.msgh_id == 3545)
    {
      int64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        int64_t v6 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v6;
        }
      }
    }

    else
    {
      int64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t task_get_dyld_image_infos( task_inspect_t task, dyld_kernel_image_info_array_t *dyld_images, mach_msg_type_number_t *dyld_imagesCnt)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_type_number_t v10;
  mach_msg_header_t v12;
  int v13;
  dyld_kernel_image_info_t *v14;
  char v15;
  unsigned int v16;
  int v17;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD7600000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7600000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v12.msgh_id == 71)
      {
        int v8 = -308;
      }

      else if (v12.msgh_id == 3546)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          int v8 = -300;
          if (v13 == 1 && *(void *)&v12.msgh_size == 56LL && v15 == 1)
          {
            uint64_t v10 = v16 / 0x28;
            if (v16 / 0x28 == v17)
            {
              int v8 = 0;
              *dyld_images = v14;
              *dyld_imagesCnt = v10;
              return v8;
            }
          }
        }

        else if (v12.msgh_size == 36)
        {
          int v8 = -300;
          if (HIDWORD(v14))
          {
            if (v12.msgh_remote_port) {
              int v8 = -300;
            }
            else {
              int v8 = HIDWORD(v14);
            }
          }
        }

        else
        {
          int v8 = -300;
        }
      }

      else
      {
        int v8 = -301;
      }

      mach_msg_destroy(&v12);
      return v8;
    }

    mig_dealloc_reply_port(v12.msgh_local_port);
  }

  return v8;
}

kern_return_t task_register_dyld_shared_cache_image_info( task_t task, dyld_kernel_image_info_t *dyld_cache_image, BOOLean_t no_cache, BOOLean_t private_cache)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  NDR_record_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t load_addr;
  BOOLean_t v15;
  BOOLean_t v16;
  int v11 = NDR_record;
  __int128 v5 = *(_OWORD *)&dyld_cache_image->fsobjid.fid_objno;
  int v12 = *(_OWORD *)dyld_cache_image->uuid;
  size_t v13 = v5;
  load_addr = dyld_cache_image->load_addr;
  int v15 = no_cache;
  int v16 = private_cache;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x5000001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD7700000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x5000001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      int v8 = -308;
    }

    else if (v10.msgh_id == 3547)
    {
      int v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        int v8 = v12;
        if (!(_DWORD)v12) {
          return v8;
        }
      }
    }

    else
    {
      int v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t task_register_dyld_set_dyld_state(task_t task, uint8_t dyld_state)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  kern_return_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  LOBYTE(v10) = dyld_state;
  *(_WORD *)((char *)&v10 + 1) = 0;
  HIBYTE(v10) = 0;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD7800000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7800000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  __int128 v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      __int128 v5 = -308;
    }

    else if (v8.msgh_id == 3548)
    {
      __int128 v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        __int128 v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      __int128 v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_register_dyld_get_process_state(task_t task, dyld_kernel_process_info_t *dyld_process_state)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  mach_msg_header_t v12;
  kern_return_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xD7900000000LL;
  __int128 v5 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7900000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v6;
    }

    if (v12.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v12.msgh_id == 3549)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 108)
        {
          if (!v12.msgh_remote_port)
          {
            int64_t v6 = v13;
            if (!v13)
            {
              uint64_t v10 = v15;
              int v11 = v17;
              *(_OWORD *)&dyld_process_state->cache_image_info.load_addr = v16;
              *(_OWORD *)&dyld_process_state->imageCount = v11;
              *(void *)&dyld_process_state->private_cache = v18;
              *(_OWORD *)dyld_process_state->cache_image_info.uuid = v14;
              *(_OWORD *)&dyld_process_state->cache_image_info.fsobjid.fid_objno = v10;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            int v8 = 1;
          }
          else {
            int v8 = v13 == 0;
          }
          if (v8) {
            int64_t v6 = -300;
          }
          else {
            int64_t v6 = v13;
          }
          goto LABEL_23;
        }
      }

      int64_t v6 = -300;
    }

    else
    {
      int64_t v6 = -301;
    }

kern_return_t task_map_corpse_info_64( task_t task, task_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  task_t v15;
  kern_return_t v16;
  mach_vm_address_t v17;
  mach_vm_size_t v18;
  mach_msg_header_t v14 = 1;
  int v15 = corspe_task;
  LODWORD(v17) = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xD7A00000000LL;
  int v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7A00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  mach_msg_type_number_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      mach_msg_type_number_t v9 = -308;
    }

    else if (v13.msgh_id == 3550)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 52)
        {
          if (!v13.msgh_remote_port)
          {
            mach_msg_type_number_t v9 = v16;
            if (!v16)
            {
              *kcd_addr_begin = v17;
              *kcd_size = v18;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            int v11 = 1;
          }
          else {
            int v11 = v16 == 0;
          }
          if (v11) {
            mach_msg_type_number_t v9 = -300;
          }
          else {
            mach_msg_type_number_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      mach_msg_type_number_t v9 = -300;
    }

    else
    {
      mach_msg_type_number_t v9 = -301;
    }

kern_return_t task_inspect( task_inspect_t task, task_inspect_flavor_t flavor, task_inspect_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  task_inspect_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[24];
  unsigned __int16 v18 = NDR_record;
  mach_msg_type_number_t v7 = *info_outCnt;
  if (*info_outCnt >= 4) {
    mach_msg_type_number_t v7 = 4;
  }
  int v19 = flavor;
  unsigned __int16 v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xD7B00000000LL;
  mach_msg_type_number_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7B00000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v17.msgh_id == 3551)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 57 <= 0xFFFFFFEE)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            uint64_t v10 = v19;
          }
          else {
            uint64_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          uint64_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 4 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            int v16 = *info_outCnt;
            if (v20 <= v16)
            {
              memmove(info_out, v21, 4LL * v20);
              uint64_t v10 = 0;
              *info_outCnt = v15;
            }

            else
            {
              memmove(info_out, v21, 4 * v16);
              *info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

kern_return_t task_get_exc_guard_behavior(task_inspect_t task, task_exc_guard_behavior_t *behavior)
{
  kern_return_t v5;
  kern_return_t v6;
  BOOL v8;
  mach_msg_header_t v10;
  kern_return_t v11;
  task_exc_guard_behavior_t v12;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD7C00000000LL;
  __int128 v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7C00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v6 = -308;
    }

    else if (v10.msgh_id == 3552)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            int64_t v6 = v11;
            if (!v11)
            {
              *behavior = v12;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            int v8 = 1;
          }
          else {
            int v8 = v11 == 0;
          }
          if (v8) {
            int64_t v6 = -300;
          }
          else {
            int64_t v6 = v11;
          }
          goto LABEL_23;
        }
      }

      int64_t v6 = -300;
    }

    else
    {
      int64_t v6 = -301;
    }

kern_return_t task_set_exc_guard_behavior(task_t task, task_exc_guard_behavior_t behavior)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  task_exc_guard_behavior_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  uint64_t v10 = behavior;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD7D00000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD7D00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  __int128 v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      __int128 v5 = -308;
    }

    else if (v8.msgh_id == 3553)
    {
      __int128 v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        __int128 v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      __int128 v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

uint64_t _kernelrpc_mach_task_is_self(unsigned int a1, _DWORD *a2)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD7F00000000LL;
  int64_t v5 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xD7F00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v6;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v10.msgh_id == 3555)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v6 = v11;
            if (!v11)
            {
              *a2 = v12;
              return v6;
            }

            goto LABEL_23;
          }
        }

        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v11 == 0;
          }
          if (v8) {
            uint64_t v6 = 4294966996LL;
          }
          else {
            uint64_t v6 = v11;
          }
          goto LABEL_23;
        }
      }

      uint64_t v6 = 4294966996LL;
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

kern_return_t task_dyld_process_info_notify_register(task_read_t target_task, mach_port_t notify)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  mach_port_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  mach_msg_header_t v10 = notify;
  int v12 = 1310720;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD8000000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD8000000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      int64_t v5 = -308;
    }

    else if (v8.msgh_id == 3556)
    {
      int64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        int64_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      int64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_create_identity_token(task_t task, task_id_token_t *token)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  task_id_token_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xD8100000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD8100000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        uint64_t v6 = -308;
      }

      else if (v9.msgh_id == 3557)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            uint64_t v6 = 0;
            *token = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          uint64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              uint64_t v6 = -300;
            }
            else {
              uint64_t v6 = v12;
            }
          }
        }

        else
        {
          uint64_t v6 = -300;
        }
      }

      else
      {
        uint64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

kern_return_t task_identity_token_get_task_port( task_id_token_t token, task_flavor_t flavor, mach_port_t *task_port)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  task_flavor_t v12;
  unsigned __int16 v13;
  unsigned int v11 = NDR_record;
  int v12 = flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, token);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD8200000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, token),  (void *)0xD8200000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        mach_msg_type_number_t v7 = -308;
      }

      else if (v10.msgh_id == 3558)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            mach_msg_type_number_t v7 = 0;
            *task_port = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          mach_msg_type_number_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              mach_msg_type_number_t v7 = -300;
            }
            else {
              mach_msg_type_number_t v7 = v12;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v7 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t task_dyld_process_info_notify_deregister(task_read_t target_task, mach_port_name_t notify)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  mach_port_name_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  mach_msg_header_t v10 = notify;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD8300000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0xD8300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      int64_t v5 = -308;
    }

    else if (v8.msgh_id == 3559)
    {
      int64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        int64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      int64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_get_exception_ports_info( mach_port_t port, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_info_array_t old_handlers_info, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v14;
  kern_return_t v15;
  BOOL v17;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  exception_mask_array_t v29;
  size_t v30;
  size_t v31;
  mach_msg_type_number_t v32;
  mach_msg_header_t v33;
  NDR_record_t v34;
  exception_mask_t v35;
  unsigned int v36;
  uint64_t v37;
  int v34 = NDR_record;
  __int128 v35 = exception_mask;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v33.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v33.msgh_remote_port = __PAIR64__(reply_port, port);
  *(void *)&v33.uint64_t msgh_voucher_port = 0xD8400000000LL;
  mach_msg_header_t v14 = mach_msg2_internal( &v33,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, port),  (void *)0xD8400000000LL,  (void *)(reply_port << 32),  (void *)0x2B0,  0LL);
  int v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v33.msgh_local_port);
      return v15;
    }

    if (v33.msgh_id == 71)
    {
      int v15 = -308;
    }

    else if (v33.msgh_id == 3560)
    {
      if ((v33.msgh_bits & 0x80000000) == 0)
      {
        if (v33.msgh_size - 681 <= 0xFFFFFD7E)
        {
          if (v33.msgh_remote_port) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v35 == 0;
          }
          if (!v17 && v33.msgh_size == 36) {
            int v15 = v35;
          }
          else {
            int v15 = -300;
          }
          goto LABEL_25;
        }

        if (!v33.msgh_remote_port)
        {
          int v15 = v35;
          if (v35) {
            goto LABEL_25;
          }
          if (v36 <= 0x20)
          {
            int v15 = -300;
            if (v36 <= (v33.msgh_size - 40) >> 2)
            {
              unsigned __int16 v20 = 4 * v36;
              int v21 = v20 + 40;
              if (v33.msgh_size >= (v20 + 40))
              {
                unsigned __int16 v22 = v33.msgh_size - v20;
                if (v36 <= (v33.msgh_size - v20 - 40) >> 3)
                {
                  int v23 = 8LL * v36;
                  if (v22 >= 8 * v36 + 40)
                  {
                    unsigned int v24 = v22 - v23;
                    if (v24 >= v21 && (v24 - 40) >> 2 >= v36)
                    {
                      uint64_t v25 = v24 - v20;
                      if (v25 == v21 && (v25 - 40) >> 2 >= v36)
                      {
                        uint64_t v26 = (char *)&v33 + v20 - 128;
                        uint64_t v27 = (uint64_t)&v26[v23 - 256];
                        uint64_t v28 = v27 + v20 - 128;
                        int v29 = masks;
                        uint64_t v30 = 4 * v36;
                        int v31 = 8LL * v36;
                        int v32 = v36;
                        memmove(v29, &v37, v30);
                        *masksCnt = v32;
                        memmove(old_handlers_info, v26 + 168, v31);
                        memmove(old_behaviors, (const void *)(v27 + 424), v30);
                        memmove(old_flavors, (const void *)(v28 + 552), v30);
                        return 0;
                      }
                    }
                  }
                }
              }
            }

            goto LABEL_25;
          }
        }
      }

      int v15 = -300;
    }

    else
    {
      int v15 = -301;
    }

kern_return_t task_test_sync_upcall(task_t task, mach_port_t port)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  mach_port_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  mach_msg_header_t v10 = port;
  int v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD8500000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD8500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      int64_t v5 = -308;
    }

    else if (v8.msgh_id == 3561)
    {
      int64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        int64_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      int64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_set_corpse_forking_behavior(task_t task, task_corpse_forking_behavior_t behavior)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  task_corpse_forking_behavior_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  mach_msg_header_t v10 = behavior;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xD8600000000LL;
  int v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD8600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      int64_t v5 = -308;
    }

    else if (v8.msgh_id == 3562)
    {
      int64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        int64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      int64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t task_test_async_upcall_propagation(task_t task, mach_port_t port, int qos, int iotier)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  int v11;
  mach_port_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  int v16;
  int v17;
  unsigned int v11 = 1;
  int v12 = port;
  mach_msg_header_t v14 = 1245184;
  int v15 = NDR_record;
  int v16 = qos;
  unsigned int v17 = iotier;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3880001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xD8700000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD8700000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_type_number_t v7 = -308;
    }

    else if (v10.msgh_id == 3563)
    {
      mach_msg_type_number_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        mach_msg_type_number_t v7 = v13;
        if (!v13) {
          return v7;
        }
      }
    }

    else
    {
      mach_msg_type_number_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t task_map_kcdata_object_64( task_t task, kcdata_object_t kcdata_object, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  kcdata_object_t v15;
  kern_return_t v16;
  mach_vm_address_t v17;
  mach_vm_size_t v18;
  mach_msg_header_t v14 = 1;
  int v15 = kcdata_object;
  LODWORD(v17) = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xD8800000000LL;
  BOOL v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0xD8800000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  mach_msg_type_number_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      mach_msg_type_number_t v9 = -308;
    }

    else if (v13.msgh_id == 3564)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 52)
        {
          if (!v13.msgh_remote_port)
          {
            mach_msg_type_number_t v9 = v16;
            if (!v16)
            {
              *kcd_addr_begin = v17;
              *kcd_size = v18;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            unsigned int v11 = 1;
          }
          else {
            unsigned int v11 = v16 == 0;
          }
          if (v11) {
            mach_msg_type_number_t v9 = -300;
          }
          else {
            mach_msg_type_number_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      mach_msg_type_number_t v9 = -300;
    }

    else
    {
      mach_msg_type_number_t v9 = -301;
    }

uint64_t task_register_hardened_exception_handler(unsigned int a1, int a2, int a3, int a4, int a5, int a6)
{
  int v12 = 1;
  int v13 = a6;
  int v15 = 1245184;
  NDR_record_t v16 = NDR_record;
  int v17 = a2;
  int v18 = a3;
  int v19 = a4;
  int v20 = a5;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xD8900000000LL;
  int64_t v8 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xD8900000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v9;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v11.msgh_id == 3565)
    {
      uint64_t v9 = 4294966996LL;
      if ((v11.msgh_bits & 0x80000000) == 0 && *(void *)&v11.msgh_size == 36LL)
      {
        uint64_t v9 = v14;
        if (!v14) {
          return v9;
        }
      }
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

    mach_msg_destroy(&v11);
  }

  return v9;
}

kern_return_t thread_terminate(thread_act_t target_act)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001511LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1000000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001511LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3700)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t act_get_state( thread_act_t target_act, int flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  int v19;
  mach_msg_size_t v20;
  _BYTE v21[5192];
  int v18 = NDR_record;
  mach_msg_type_number_t v7 = *old_stateCnt;
  if (*old_stateCnt >= 0x510) {
    mach_msg_type_number_t v7 = 1296;
  }
  int v19 = flavor;
  int v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xE1100000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1100000000LL,  (void *)(reply_port << 32),  (void *)0x1470,  0LL);
  mach_msg_header_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      mach_msg_header_t v10 = -308;
    }

    else if (v17.msgh_id == 3701)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 5225 <= 0xFFFFEBBE)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            mach_msg_header_t v10 = v19;
          }
          else {
            mach_msg_header_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          mach_msg_header_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 0x510 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            NDR_record_t v16 = *old_stateCnt;
            if (v20 <= v16)
            {
              memmove(old_state, v21, 4LL * v20);
              mach_msg_header_t v10 = 0;
              *old_stateCnt = v15;
            }

            else
            {
              memmove(old_state, v21, 4 * v16);
              *old_stateCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      mach_msg_header_t v10 = -300;
    }

    else
    {
      mach_msg_header_t v10 = -301;
    }

kern_return_t act_set_state( thread_act_t target_act, int flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  int v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  int v12 = NDR_record;
  int v13 = flavor;
  if (new_stateCnt > 0x510) {
    return -307;
  }
  mach_msg_type_number_t v7 = 4 * new_stateCnt;
  memmove(&v15, new_state, 4 * new_stateCnt);
  unsigned int v14 = new_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xE1200000000LL;
  uint64_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1200000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v11.msgh_id == 3702)
    {
      int v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t thread_get_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  thread_state_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[5192];
  int v18 = NDR_record;
  mach_msg_type_number_t v7 = *old_stateCnt;
  if (*old_stateCnt >= 0x510) {
    mach_msg_type_number_t v7 = 1296;
  }
  int v19 = flavor;
  int v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xE1300000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1300000000LL,  (void *)(reply_port << 32),  (void *)0x1470,  0LL);
  mach_msg_header_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      mach_msg_header_t v10 = -308;
    }

    else if (v17.msgh_id == 3703)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 5225 <= 0xFFFFEBBE)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            mach_msg_header_t v10 = v19;
          }
          else {
            mach_msg_header_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          mach_msg_header_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 0x510 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            NDR_record_t v16 = *old_stateCnt;
            if (v20 <= v16)
            {
              memmove(old_state, v21, 4LL * v20);
              mach_msg_header_t v10 = 0;
              *old_stateCnt = v15;
            }

            else
            {
              memmove(old_state, v21, 4 * v16);
              *old_stateCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      mach_msg_header_t v10 = -300;
    }

    else
    {
      mach_msg_header_t v10 = -301;
    }

kern_return_t thread_set_state( thread_act_t target_act, thread_state_flavor_t flavor, thread_state_t new_state, mach_msg_type_number_t new_stateCnt)
{
  kern_return_t v4;
  mach_msg_type_number_t v7;
  uint64_t reply_port;
  kern_return_t v9;
  mach_msg_header_t v11;
  NDR_record_t v12;
  thread_state_flavor_t v13;
  mach_msg_type_number_t v14;
  uint64_t v15;
  int v12 = NDR_record;
  int v13 = flavor;
  if (new_stateCnt > 0x510) {
    return -307;
  }
  mach_msg_type_number_t v7 = 4 * new_stateCnt;
  memmove(&v15, new_state, 4 * new_stateCnt);
  unsigned int v14 = new_stateCnt;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xE1400000000LL;
  uint64_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1400000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v11.msgh_id == 3704)
    {
      int v4 = -300;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        int v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t thread_suspend(thread_act_t target_act)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1500000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1500000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3705)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_resume(thread_act_t target_act)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1600000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3706)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_abort(thread_act_t target_act)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1700000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3707)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_abort_safely(thread_act_t target_act)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1800000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1800000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3708)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_depress_abort(thread_act_t thread)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE1900000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE1900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      int v4 = -308;
    }

    else if (v7.msgh_id == 3709)
    {
      int v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        int v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      int v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_get_special_port(thread_act_t thr_act, int which_port, mach_port_t *special_port)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  int v12;
  unsigned __int16 v13;
  mach_msg_header_t v11 = NDR_record;
  int v12 = which_port;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, thr_act);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xE1A00000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, thr_act),  (void *)0xE1A00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  mach_msg_type_number_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        mach_msg_type_number_t v7 = -308;
      }

      else if (v10.msgh_id == 3710)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          mach_msg_type_number_t v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            mach_msg_type_number_t v7 = 0;
            *special_port = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          mach_msg_type_number_t v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              mach_msg_type_number_t v7 = -300;
            }
            else {
              mach_msg_type_number_t v7 = v12;
            }
          }
        }

        else
        {
          mach_msg_type_number_t v7 = -300;
        }
      }

      else
      {
        mach_msg_type_number_t v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t thread_set_special_port(thread_act_t thr_act, int which_port, mach_port_t special_port)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  mach_port_t v11;
  kern_return_t v12;
  int v13;
  NDR_record_t v14;
  int v15;
  mach_msg_header_t v10 = 1;
  mach_msg_header_t v11 = special_port;
  int v13 = 1245184;
  unsigned int v14 = NDR_record;
  int v15 = which_port;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, thr_act);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xE1B00000000LL;
  int64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, thr_act),  (void *)0xE1B00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v6;
    }

    if (v9.msgh_id == 71)
    {
      uint64_t v6 = -308;
    }

    else if (v9.msgh_id == 3711)
    {
      uint64_t v6 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && v9.msgh_size == 36 && !v9.msgh_remote_port)
      {
        uint64_t v6 = v12;
        if (!v12) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v6;
}

kern_return_t thread_info( thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  uint64_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  thread_flavor_t v19;
  mach_msg_size_t v20;
  _BYTE v21[136];
  int v18 = NDR_record;
  mach_msg_type_number_t v7 = *thread_info_outCnt;
  if (*thread_info_outCnt >= 0x20) {
    mach_msg_type_number_t v7 = 32;
  }
  int v19 = flavor;
  int v20 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v17.uint64_t msgh_voucher_port = 0xE1C00000000LL;
  uint64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE1C00000000LL,  (void *)(reply_port << 32),  (void *)0xB0,  0LL);
  mach_msg_header_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      mach_msg_header_t v10 = -308;
    }

    else if (v17.msgh_id == 3712)
    {
      if ((v17.msgh_bits & 0x80000000) == 0)
      {
        if (v17.msgh_size - 169 <= 0xFFFFFF7E)
        {
          if (v17.msgh_remote_port) {
            int v12 = 1;
          }
          else {
            int v12 = v19 == 0;
          }
          if (!v12 && v17.msgh_size == 36) {
            mach_msg_header_t v10 = v19;
          }
          else {
            mach_msg_header_t v10 = -300;
          }
          goto LABEL_27;
        }

        if (!v17.msgh_remote_port)
        {
          mach_msg_header_t v10 = v19;
          if (v19) {
            goto LABEL_27;
          }
          int v15 = v20;
          if (v20 <= 0x20 && v20 <= (v17.msgh_size - 40) >> 2 && v17.msgh_size == 4 * v20 + 40)
          {
            NDR_record_t v16 = *thread_info_outCnt;
            if (v20 <= v16)
            {
              memmove(thread_info_out, v21, 4LL * v20);
              mach_msg_header_t v10 = 0;
              *thread_info_outCnt = v15;
            }

            else
            {
              memmove(thread_info_out, v21, 4 * v16);
              *thread_info_outCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }

      mach_msg_header_t v10 = -300;
    }

    else
    {
      mach_msg_header_t v10 = -301;
    }

kern_return_t thread_set_exception_ports( thread_act_t thread, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v10;
  int v11;
  mach_port_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  exception_mask_t v16;
  exception_behavior_t v17;
  thread_state_flavor_t v18;
  mach_msg_header_t v11 = 1;
  int v12 = new_port;
  unsigned int v14 = 1245184;
  int v15 = NDR_record;
  NDR_record_t v16 = exception_mask;
  int v17 = behavior;
  int v18 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xE1D00000000LL;
  mach_msg_type_number_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE1D00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v8 = -308;
    }

    else if (v10.msgh_id == 3713)
    {
      int64_t v8 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        int64_t v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      int64_t v8 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t thread_get_exception_ports( thread_inspect_t thread, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v14;
  kern_return_t v15;
  unsigned __int8 *p_int_rep;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  NDR_record_t v28;
  exception_mask_t v29;
  mach_msg_size_t v30;
  uint64_t v31;
  uint64_t v28 = NDR_record;
  int v29 = exception_mask;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v27.uint64_t msgh_voucher_port = 0xE1E00000000LL;
  unsigned int v14 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE1E00000000LL,  (void *)(reply_port << 32),  (void *)0x330,  0LL);
  int v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v27.msgh_local_port);
      return v15;
    }

    if (v27.msgh_id == 71)
    {
      int v15 = -308;
    }

    else if (v27.msgh_id == 3714)
    {
      if ((v27.msgh_bits & 0x80000000) != 0)
      {
        int v15 = -300;
        if (*(_DWORD *)&v28.mig_vers != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
          goto LABEL_27;
        }
        p_int_rep = &v28.int_rep;
        int v18 = 36LL;
        while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
        {
          v18 += 12LL;
          if ((_DWORD)v18 == 420)
          {
            int v19 = v30;
            if (v30 > 0x20) {
              break;
            }
            int v15 = -300;
            if (v30 <= (v27.msgh_size - 424) >> 2)
            {
              int v21 = 4 * v30;
              unsigned __int16 v22 = v21 + 424;
              if (v27.msgh_size >= (v21 + 424))
              {
                int v23 = v27.msgh_size - v21;
                if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v30)
                {
                  unsigned int v24 = v23 - v21;
                  if (v24 == v22 && (v24 - 424) >> 2 >= v30)
                  {
                    uint64_t v25 = (char *)&v27 + v21 - 128;
                    memmove(masks, &v31, 4 * v30);
                    *masksCnt = v19;
                    if ((_DWORD)v19)
                    {
                      do
                      {
                        uint64_t v26 = *(_DWORD *)p_int_rep;
                        p_int_rep += 12;
                        *old_handlers++ = v26;
                        --v19;
                      }

                      while (v19);
                    }

                    memmove(old_behaviors, v25 + 552, v21);
                    memmove(old_flavors, &v25[v21 + 552], v21);
                    return 0;
                  }
                }
              }
            }

            goto LABEL_27;
          }
        }
      }

      else if (v27.msgh_size == 36)
      {
        int v15 = -300;
        if (v29)
        {
          if (v27.msgh_remote_port) {
            int v15 = -300;
          }
          else {
            int v15 = v29;
          }
        }

        goto LABEL_27;
      }

      int v15 = -300;
    }

    else
    {
      int v15 = -301;
    }

kern_return_t thread_swap_exception_ports( thread_act_t thread, exception_mask_t exception_mask, mach_port_t new_port, exception_behavior_t behavior, thread_state_flavor_t new_flavor, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_array_t old_handlers, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v15;
  kern_return_t v16;
  exception_handler_t *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v21;
  unsigned int v22;
  int v23;
  int v24;
  char *v25;
  exception_handler_t v26;
  mach_msg_header_t v27;
  int v28;
  mach_port_t v29;
  kern_return_t v30;
  int v31;
  NDR_record_t v32;
  exception_mask_t v33;
  exception_behavior_t v34;
  thread_state_flavor_t v35;
  mach_msg_size_t v36;
  uint64_t v37;
  uint64_t v28 = 1;
  int v29 = new_port;
  int v31 = 1245184;
  int v32 = NDR_record;
  int v33 = exception_mask;
  int v34 = behavior;
  __int128 v35 = new_flavor;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v27.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v27.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v27.uint64_t msgh_voucher_port = 0xE1F00000000LL;
  int v15 = mach_msg2_internal( &v27,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE1F00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x330,  0LL);
  NDR_record_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (v27.msgh_id == 71)
      {
        NDR_record_t v16 = -308;
      }

      else if (v27.msgh_id == 3715)
      {
        if ((v27.msgh_bits & 0x80000000) != 0)
        {
          NDR_record_t v16 = -300;
          if (v28 != 32 || v27.msgh_size < 0x1A8 || v27.msgh_size > 0x328 || v27.msgh_remote_port) {
            goto LABEL_24;
          }
          int v17 = &v29;
          int v18 = 36LL;
          while (!*((_BYTE *)&v27.msgh_bits + v18 + 3))
          {
            v18 += 12LL;
            if ((_DWORD)v18 == 420)
            {
              int v19 = v36;
              if (v36 > 0x20) {
                break;
              }
              NDR_record_t v16 = -300;
              if (v36 <= (v27.msgh_size - 424) >> 2)
              {
                int v21 = 4 * v36;
                unsigned __int16 v22 = v21 + 424;
                if (v27.msgh_size >= (v21 + 424))
                {
                  int v23 = v27.msgh_size - v21;
                  if (v27.msgh_size - (int)v21 >= v22 && (v23 - 424) >> 2 >= v36)
                  {
                    unsigned int v24 = v23 - v21;
                    if (v24 == v22 && (v24 - 424) >> 2 >= v36)
                    {
                      uint64_t v25 = (char *)&v27 + v21 - 128;
                      memmove(masks, &v37, 4 * v36);
                      *masksCnt = v19;
                      if ((_DWORD)v19)
                      {
                        do
                        {
                          uint64_t v26 = *v17;
                          v17 += 3;
                          *old_handlers++ = v26;
                          --v19;
                        }

                        while (v19);
                      }

                      memmove(old_behaviors, v25 + 552, v21);
                      memmove(old_flavors, &v25[v21 + 552], v21);
                      return 0;
                    }
                  }
                }
              }

              goto LABEL_24;
            }
          }
        }

        else if (v27.msgh_size == 36)
        {
          NDR_record_t v16 = -300;
          if (v30)
          {
            if (v27.msgh_remote_port) {
              NDR_record_t v16 = -300;
            }
            else {
              NDR_record_t v16 = v30;
            }
          }

          goto LABEL_24;
        }

        NDR_record_t v16 = -300;
      }

      else
      {
        NDR_record_t v16 = -301;
      }

uint64_t _kernelrpc_thread_policy(unsigned int a1, unsigned int a2, void *__src, unsigned int a4, int a5)
{
  NDR_record_t v14 = NDR_record;
  unsigned int v15 = a2;
  if (a4 > 5) {
    return 4294966989LL;
  }
  size_t v9 = 4 * a4;
  memmove(&v17, __src, v9);
  unsigned int v16 = a4;
  *(_DWORD *)((char *)&v13 + v9 + 40) = a5;
  uint64_t reply_port = mig_get_reply_port();
  v13.mach_msg_bits_t msgh_bits = 5395;
  v13.msgh_size = v9 + 44;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0xE2000000000LL;
  int64_t v11 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)(((unint64_t)((v9 + 44) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xE2000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v5;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v13.msgh_id == 3716)
    {
      uint64_t v5 = 4294966996LL;
      if ((v13.msgh_bits & 0x80000000) == 0 && v13.msgh_size == 36 && !v13.msgh_remote_port)
      {
        uint64_t v5 = v15;
        if (!v15) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v13);
  }

  return v5;
}

uint64_t _kernelrpc_thread_policy_set(unsigned int a1, unsigned int a2, void *__src, unsigned int a4)
{
  NDR_record_t v12 = NDR_record;
  unsigned int v13 = a2;
  if (a4 > 0x10) {
    return 4294966989LL;
  }
  int v7 = 4 * a4;
  memmove(&v15, __src, 4 * a4);
  unsigned int v14 = a4;
  uint64_t reply_port = mig_get_reply_port();
  v11.mach_msg_bits_t msgh_bits = 5395;
  v11.msgh_size = v7 + 40;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xE2100000000LL;
  int64_t v9 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)(((unint64_t)((v7 + 40) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xE2100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v4 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v11.msgh_local_port);
      return v4;
    }

    if (v11.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (v11.msgh_id == 3717)
    {
      uint64_t v4 = 4294966996LL;
      if ((v11.msgh_bits & 0x80000000) == 0 && v11.msgh_size == 36 && !v11.msgh_remote_port)
      {
        uint64_t v4 = v13;
        if (!v13) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&v11);
  }

  return v4;
}

kern_return_t thread_policy_get( thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  kern_return_t v11;
  kern_return_t v12;
  BOOL v14;
  mach_msg_type_number_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  mach_msg_header_t v21;
  NDR_record_t v22;
  thread_policy_flavor_t v23;
  mach_msg_size_t v24;
  _DWORD v25[20];
  unsigned __int16 v22 = NDR_record;
  mach_msg_type_number_t v9 = *policy_infoCnt;
  if (*policy_infoCnt >= 0x10) {
    mach_msg_type_number_t v9 = 16;
  }
  int v23 = flavor;
  unsigned int v24 = v9;
  v25[0] = *get_default;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v21.mach_msg_bits_t msgh_bits = 0x2C00001513LL;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v21.uint64_t msgh_voucher_port = 0xE2200000000LL;
  mach_msg_header_t v11 = mach_msg2_internal( &v21,  0x200000003uLL,  (void *)0x2C00001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2200000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  NDR_record_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (v11)
    {
      mig_dealloc_reply_port(v21.msgh_local_port);
      return v12;
    }

    if (v21.msgh_id == 71)
    {
      NDR_record_t v12 = -308;
    }

    else if (v21.msgh_id == 3718)
    {
      if ((v21.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v21.msgh_size - 109 <= 0xFFFFFFBE)
      {
        if (v21.msgh_remote_port) {
          unsigned int v14 = 1;
        }
        else {
          unsigned int v14 = v23 == 0;
        }
        if (!v14 && v21.msgh_size == 36) {
          NDR_record_t v12 = v23;
        }
        else {
          NDR_record_t v12 = -300;
        }
        goto LABEL_27;
      }

      if (v21.msgh_remote_port) {
        goto LABEL_26;
      }
      NDR_record_t v12 = v23;
      if (v23) {
        goto LABEL_27;
      }
      uint64_t v17 = v24;
      if (v24 > 0x10)
      {
LABEL_26:
        NDR_record_t v12 = -300;
      }

      else
      {
        NDR_record_t v12 = -300;
        if (v24 <= (v21.msgh_size - 44) >> 2)
        {
          int v18 = 4 * v24;
          if (v21.msgh_size == (_DWORD)v18 + 44)
          {
            int v19 = *policy_infoCnt;
            if (v24 <= v19)
            {
              int v20 = (char *)&v21 + v18;
              memmove(policy_info, v25, v18);
              NDR_record_t v12 = 0;
              *policy_infoCnt = v17;
              *get_default = *((_DWORD *)v20 + 10);
            }

            else
            {
              memmove(policy_info, v25, 4 * v19);
              *policy_infoCnt = v17;
              return -307;
            }

            return v12;
          }
        }
      }
    }

    else
    {
      NDR_record_t v12 = -301;
    }

kern_return_t thread_sample(thread_act_t thread, mach_port_t reply)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  mach_port_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  mach_msg_header_t v10 = reply;
  NDR_record_t v12 = 1310720;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE2300000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2300000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = -308;
    }

    else if (v8.msgh_id == 3719)
    {
      uint64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t etap_trace_thread(thread_act_t target_act, BOOLean_t trace_status)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  NDR_record_t v9;
  BOOLean_t v10;
  mach_msg_type_number_t v9 = NDR_record;
  mach_msg_header_t v10 = trace_status;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, target_act);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE2400000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, target_act),  (void *)0xE2400000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = -308;
    }

    else if (v8.msgh_id == 3720)
    {
      uint64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t thread_assign(thread_act_t thread, processor_set_t new_set)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  processor_set_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  mach_msg_header_t v10 = new_set;
  NDR_record_t v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE2500000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = -308;
    }

    else if (v8.msgh_id == 3721)
    {
      uint64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t thread_assign_default(thread_act_t thread)
{
  kern_return_t v3;
  kern_return_t v4;
  mach_msg_header_t v7;
  kern_return_t v8;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xE2600000000LL;
  mach_msg_size_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2600000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      uint64_t v4 = -308;
    }

    else if (v7.msgh_id == 3722)
    {
      uint64_t v4 = -300;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        uint64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = -301;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t thread_get_assignment(thread_act_t thread, processor_set_name_t *assigned_set)
{
  kern_return_t v5;
  kern_return_t v6;
  mach_msg_header_t v9;
  int v10;
  processor_set_name_t v11;
  kern_return_t v12;
  unsigned __int16 v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v9.uint64_t msgh_voucher_port = 0xE2700000000LL;
  uint64_t v5 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2700000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (v9.msgh_id == 71)
      {
        uint64_t v6 = -308;
      }

      else if (v9.msgh_id == 3723)
      {
        if ((v9.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v6 = -300;
          if (v10 == 1 && *(void *)&v9.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            uint64_t v6 = 0;
            *assigned_set = v11;
            return v6;
          }
        }

        else if (v9.msgh_size == 36)
        {
          uint64_t v6 = -300;
          if (v12)
          {
            if (v9.msgh_remote_port) {
              uint64_t v6 = -300;
            }
            else {
              uint64_t v6 = v12;
            }
          }
        }

        else
        {
          uint64_t v6 = -300;
        }
      }

      else
      {
        uint64_t v6 = -301;
      }

      mach_msg_destroy(&v9);
      return v6;
    }

    mig_dealloc_reply_port(v9.msgh_local_port);
  }

  return v6;
}

uint64_t _kernelrpc_thread_set_policy( unsigned int a1, int a2, int a3, void *__src, unsigned int a5, const void *a6, unsigned int a7)
{
  unsigned int v17 = 1;
  int v18 = a2;
  int v20 = 1245184;
  NDR_record_t v21 = NDR_record;
  int v22 = a3;
  if (a5 > 5) {
    return 4294966989LL;
  }
  size_t v11 = 4 * a5;
  memmove(&v24, __src, v11);
  unsigned int v23 = a5;
  if (a7 > 1) {
    return 4294966989LL;
  }
  memmove((char *)&v16 + v11 + 60, a6, 4 * a7);
  *(_DWORD *)((char *)&v16 + v11 + 56) = a7;
  uint64_t reply_port = mig_get_reply_port();
  v16.mach_msg_bits_t msgh_bits = -2147478253;
  v16.msgh_size = v11 + 4 * a7 + 60;
  *(void *)&v16.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v16.uint64_t msgh_voucher_port = 0xE2800000000LL;
  int64_t v15 = mach_msg2_internal( &v16,  0x200000003uLL,  (void *)(((unint64_t)v16.msgh_size << 32) | 0x80001513),  (void *)__PAIR64__(reply_port, a1),  (void *)0xE2800000000LL,  (void *)(v17 | (unint64_t)(reply_port << 32)),  (void *)0x2C,  0LL);
  uint64_t v12 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v15)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v12;
    }

    if (v16.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (v16.msgh_id == 3724)
    {
      uint64_t v12 = 4294966996LL;
      if ((v16.msgh_bits & 0x80000000) == 0 && v16.msgh_size == 36 && !v16.msgh_remote_port)
      {
        uint64_t v12 = v19;
        if (!v19) {
          return v12;
        }
      }
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

    mach_msg_destroy(&v16);
  }

  return v12;
}

kern_return_t thread_get_mach_voucher( thread_act_t thr_act, mach_voucher_selector_t which, ipc_voucher_t *voucher)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  mach_voucher_selector_t v12;
  unsigned __int16 v13;
  size_t v11 = NDR_record;
  uint64_t v12 = which;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, thr_act);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xE2900000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, thr_act),  (void *)0xE2900000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  int v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (v10.msgh_id == 71)
      {
        int v7 = -308;
      }

      else if (v10.msgh_id == 3725)
      {
        if ((v10.msgh_bits & 0x80000000) != 0)
        {
          int v7 = -300;
          if (*(_DWORD *)&v11.mig_vers == 1 && *(void *)&v10.msgh_size == 40LL && v13 << 16 == 1114112)
          {
            int v7 = 0;
            *voucher = *(_DWORD *)&v11.int_rep;
            return v7;
          }
        }

        else if (v10.msgh_size == 36)
        {
          int v7 = -300;
          if (v12)
          {
            if (v10.msgh_remote_port) {
              int v7 = -300;
            }
            else {
              int v7 = v12;
            }
          }
        }

        else
        {
          int v7 = -300;
        }
      }

      else
      {
        int v7 = -301;
      }

      mach_msg_destroy(&v10);
      return v7;
    }

    mig_dealloc_reply_port(v10.msgh_local_port);
  }

  return v7;
}

kern_return_t thread_set_mach_voucher(thread_act_t thr_act, ipc_voucher_t voucher)
{
  kern_return_t v4;
  kern_return_t v5;
  mach_msg_header_t v8;
  int v9;
  ipc_voucher_t v10;
  kern_return_t v11;
  int v12;
  mach_msg_type_number_t v9 = 1;
  mach_msg_header_t v10 = voucher;
  uint64_t v12 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2880001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, thr_act);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xE2A00000000LL;
  uint64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2880001513LL,  (void *)__PAIR64__(reply_port, thr_act),  (void *)0xE2A00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if (v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = -308;
    }

    else if (v8.msgh_id == 3726)
    {
      uint64_t v5 = -300;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v11;
        if (!v11) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = -301;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t thread_swap_mach_voucher( thread_act_t thr_act, ipc_voucher_t new_voucher, ipc_voucher_t *old_voucher)
{
  kern_return_t v7;
  kern_return_t v8;
  mach_msg_header_t v11;
  int v12;
  ipc_voucher_t v13;
  kern_return_t v14;
  int v15;
  ipc_voucher_t v16;
  int v17;
  uint64_t v12 = 2;
  unsigned int v13 = new_voucher;
  ipc_voucher_t v5 = *old_voucher;
  int64_t v15 = 1245184;
  mach_msg_header_t v16 = v5;
  unsigned int v17 = 1245184;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v11.mach_msg_bits_t msgh_bits = 0x3480001513LL;
  *(void *)&v11.msgh_remote_port = __PAIR64__(reply_port, thr_act);
  *(void *)&v11.uint64_t msgh_voucher_port = 0xE2B00000000LL;
  int v7 = mach_msg2_internal( &v11,  0x200000003uLL,  (void *)0x3480001513LL,  (void *)__PAIR64__(reply_port, thr_act),  (void *)0xE2B00000000LL,  (void *)((reply_port << 32) | 2),  (void *)0x30,  0LL);
  int64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        int64_t v8 = -308;
      }

      else if (v11.msgh_id == 3727)
      {
        if ((v11.msgh_bits & 0x80000000) != 0)
        {
          int64_t v8 = -300;
          if (v12 == 1 && v11.msgh_size == 40 && !v11.msgh_remote_port && HIWORD(v15) << 16 == 1114112)
          {
            int64_t v8 = 0;
            *old_voucher = v13;
            return v8;
          }
        }

        else if (v11.msgh_size == 36)
        {
          int64_t v8 = -300;
          if (v14)
          {
            if (v11.msgh_remote_port) {
              int64_t v8 = -300;
            }
            else {
              int64_t v8 = v14;
            }
          }
        }

        else
        {
          int64_t v8 = -300;
        }
      }

      else
      {
        int64_t v8 = -301;
      }

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_reply_port(v11.msgh_local_port);
  }

  return v8;
}

kern_return_t thread_convert_thread_state( thread_act_t thread, int direction, thread_state_flavor_t flavor, thread_state_t in_state, mach_msg_type_number_t in_stateCnt, thread_state_t out_state, mach_msg_type_number_t *out_stateCnt)
{
  kern_return_t v7;
  size_t v12;
  mach_msg_type_number_t v13;
  uint64_t reply_port;
  kern_return_t v15;
  BOOL v16;
  mach_msg_type_number_t v19;
  uint64_t v20;
  mach_msg_header_t v21;
  NDR_record_t v22;
  int v23;
  unsigned int v24;
  mach_msg_type_number_t v25;
  int v26;
  int v22 = NDR_record;
  unsigned int v23 = direction;
  int v24 = flavor;
  if (in_stateCnt > 0x510) {
    return -307;
  }
  uint64_t v12 = 4 * in_stateCnt;
  memmove(&v26, in_state, v12);
  uint64_t v25 = in_stateCnt;
  unsigned int v13 = *out_stateCnt;
  if (*out_stateCnt >= 0x510) {
    unsigned int v13 = 1296;
  }
  *(_DWORD *)((char *)&v21 + v12 + 44) = v13;
  uint64_t reply_port = mig_get_reply_port();
  v21.mach_msg_bits_t msgh_bits = 5395;
  v21.msgh_size = v12 + 48;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, thread);
  *(void *)&v21.uint64_t msgh_voucher_port = 0xE2C00000000LL;
  int64_t v15 = mach_msg2_internal( &v21,  0x200000003uLL,  (void *)(((unint64_t)((v12 + 48) >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, thread),  (void *)0xE2C00000000LL,  (void *)(reply_port << 32),  (void *)0x1470,  0LL);
  int v7 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(v21.msgh_local_port);
      return v7;
    }

    if (v21.msgh_id == 71)
    {
      int v7 = -308;
    }

    else if (v21.msgh_id == 3728)
    {
      if ((v21.msgh_bits & 0x80000000) == 0)
      {
        if (v21.msgh_size - 5225 <= 0xFFFFEBBE)
        {
          if (v21.msgh_remote_port) {
            mach_msg_header_t v16 = 1;
          }
          else {
            mach_msg_header_t v16 = v23 == 0;
          }
          if (!v16 && v21.msgh_size == 36) {
            int v7 = v23;
          }
          else {
            int v7 = -300;
          }
          goto LABEL_26;
        }

        if (!v21.msgh_remote_port)
        {
          int v7 = v23;
          if (v23) {
            goto LABEL_26;
          }
          unsigned int v19 = v24;
          if (v24 <= 0x510 && v24 <= (v21.msgh_size - 40) >> 2 && v21.msgh_size == 4 * v24 + 40)
          {
            int v20 = *out_stateCnt;
            if (v24 <= v20)
            {
              memmove(out_state, &v25, 4LL * v24);
              int v7 = 0;
              *out_stateCnt = v19;
              return v7;
            }

            memmove(out_state, &v25, 4 * v20);
            *out_stateCnt = v19;
            return -307;
          }
        }
      }

      int v7 = -300;
    }

    else
    {
      int v7 = -301;
    }

kern_return_t thread_get_exception_ports_info( mach_port_t port, exception_mask_t exception_mask, exception_mask_array_t masks, mach_msg_type_number_t *masksCnt, exception_handler_info_array_t old_handlers_info, exception_behavior_array_t old_behaviors, exception_flavor_array_t old_flavors)
{
  kern_return_t v14;
  kern_return_t v15;
  BOOL v17;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  exception_mask_array_t v29;
  size_t v30;
  size_t v31;
  mach_msg_type_number_t v32;
  mach_msg_header_t v33;
  NDR_record_t v34;
  exception_mask_t v35;
  unsigned int v36;
  uint64_t v37;
  int v34 = NDR_record;
  __int128 v35 = exception_mask;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v33.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v33.msgh_remote_port = __PAIR64__(reply_port, port);
  *(void *)&v33.uint64_t msgh_voucher_port = 0xE2E00000000LL;
  unsigned int v14 = mach_msg2_internal( &v33,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, port),  (void *)0xE2E00000000LL,  (void *)(reply_port << 32),  (void *)0x2B0,  0LL);
  int64_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (v14)
    {
      mig_dealloc_reply_port(v33.msgh_local_port);
      return v15;
    }

    if (v33.msgh_id == 71)
    {
      int64_t v15 = -308;
    }

    else if (v33.msgh_id == 3730)
    {
      if ((v33.msgh_bits & 0x80000000) == 0)
      {
        if (v33.msgh_size - 681 <= 0xFFFFFD7E)
        {
          if (v33.msgh_remote_port) {
            unsigned int v17 = 1;
          }
          else {
            unsigned int v17 = v35 == 0;
          }
          if (!v17 && v33.msgh_size == 36) {
            int64_t v15 = v35;
          }
          else {
            int64_t v15 = -300;
          }
          goto LABEL_25;
        }

        if (!v33.msgh_remote_port)
        {
          int64_t v15 = v35;
          if (v35) {
            goto LABEL_25;
          }
          if (v36 <= 0x20)
          {
            int64_t v15 = -300;
            if (v36 <= (v33.msgh_size - 40) >> 2)
            {
              int v20 = 4 * v36;
              NDR_record_t v21 = v20 + 40;
              if (v33.msgh_size >= (v20 + 40))
              {
                int v22 = v33.msgh_size - v20;
                if (v36 <= (v33.msgh_size - v20 - 40) >> 3)
                {
                  unsigned int v23 = 8LL * v36;
                  if (v22 >= 8 * v36 + 40)
                  {
                    int v24 = v22 - v23;
                    if (v24 >= v21 && (v24 - 40) >> 2 >= v36)
                    {
                      uint64_t v25 = v24 - v20;
                      if (v25 == v21 && (v25 - 40) >> 2 >= v36)
                      {
                        uint64_t v26 = (char *)&v33 + v20 - 128;
                        uint64_t v27 = (uint64_t)&v26[v23 - 256];
                        uint64_t v28 = v27 + v20 - 128;
                        int v29 = masks;
                        uint64_t v30 = 4 * v36;
                        int v31 = 8LL * v36;
                        int v32 = v36;
                        memmove(v29, &v37, v30);
                        *masksCnt = v32;
                        memmove(old_handlers_info, v26 + 168, v31);
                        memmove(old_behaviors, (const void *)(v27 + 424), v30);
                        memmove(old_flavors, (const void *)(v28 + 552), v30);
                        return 0;
                      }
                    }
                  }
                }
              }
            }

            goto LABEL_25;
          }
        }
      }

      int64_t v15 = -300;
    }

    else
    {
      int64_t v15 = -301;
    }

uint64_t thread_adopt_exception_handler(unsigned int a1, int a2, int a3, int a4, int a5)
{
  int v11 = 1;
  int v12 = a2;
  int v14 = 1245184;
  NDR_record_t v15 = NDR_record;
  int v16 = a3;
  int v17 = a4;
  int v18 = a5;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3C80001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0xE2F00000000LL;
  int64_t v7 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3C80001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xE2F00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v8;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v8 = 4294966988LL;
    }

    else if (v10.msgh_id == 3731)
    {
      uint64_t v8 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && *(void *)&v10.msgh_size == 36LL)
      {
        uint64_t v8 = v13;
        if (!v13) {
          return v8;
        }
      }
    }

    else
    {
      uint64_t v8 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v8;
}

kern_return_t vm_inherit( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_inherit_t new_inheritance)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  vm_address_t v12;
  vm_size_t v13;
  vm_inherit_t v14;
  int v11 = NDR_record;
  int v12 = address;
  unsigned int v13 = size;
  int v14 = new_inheritance;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C300000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C300000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4903)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_vm_read(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, _DWORD *a5)
{
  *(NDR_record_t *)&__int128 v15 = NDR_record;
  *((void *)&v15 + 1) = a2;
  uint64_t v16 = a3;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12C400000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12C400000000LL,  (void *)(reply_port << 32),  (void *)0x40,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v14.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v14.msgh_id == 4904)
      {
        if ((v14.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996LL;
          if ((_DWORD)v15 == 1 && *(void *)&v14.msgh_size == 56LL && HIBYTE(v15) == 1)
          {
            int v12 = v16;
            if ((_DWORD)v16 == v17)
            {
              uint64_t v10 = 0LL;
              *a4 = *(void *)((char *)&v15 + 4);
              *a5 = v12;
              return v10;
            }
          }
        }

        else if (v14.msgh_size == 36)
        {
          uint64_t v10 = 4294966996LL;
          if (DWORD2(v15))
          {
            if (v14.msgh_remote_port) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = DWORD2(v15);
            }
          }
        }

        else
        {
          uint64_t v10 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

      mach_msg_destroy(&v14);
      return v10;
    }

    mig_dealloc_reply_port(v14.msgh_local_port);
  }

  return v10;
}

kern_return_t vm_read_list(vm_map_t target_task, vm_read_entry_t data_list, natural_t count)
{
  kern_return_t v7;
  kern_return_t v8;
  BOOL v10;
  mach_msg_header_t v12;
  NDR_record_t v13;
  kern_return_t v14;
  _DWORD v15[1027];
  unsigned int v13 = NDR_record;
  memmove(&v14, data_list, 0x1000uLL);
  v15[1023] = count;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x102400001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x12C500000000LL;
  int64_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x102400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C500000000LL,  (void *)(reply_port << 32),  (void *)0x102C,  0LL);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v8 = -308;
    }

    else if (v12.msgh_id == 4905)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 4132)
        {
          if (!v12.msgh_remote_port)
          {
            uint64_t v8 = v14;
            if (!v14)
            {
              memmove(data_list, v15, 0x1000uLL);
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = v14 == 0;
          }
          if (v10) {
            uint64_t v8 = -300;
          }
          else {
            uint64_t v8 = v14;
          }
          goto LABEL_23;
        }
      }

      uint64_t v8 = -300;
    }

    else
    {
      uint64_t v8 = -301;
    }

kern_return_t vm_write( vm_map_t target_task, vm_address_t address, vm_offset_t data, mach_msg_type_number_t dataCnt)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v9;
  int v10;
  vm_offset_t v11;
  int v12;
  mach_msg_type_number_t v13;
  NDR_record_t v14;
  vm_address_t v15;
  mach_msg_type_number_t v16;
  uint64_t v10 = 1;
  int v11 = data;
  int v12 = 16777472;
  unsigned int v13 = dataCnt;
  mach_msg_header_t v14 = NDR_record;
  __int128 v15 = address;
  uint64_t v16 = dataCnt;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 0x4080001513LL;
  *(void *)&v9.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v9.uint64_t msgh_voucher_port = 0x12C600000000LL;
  uint64_t v6 = mach_msg2_internal( &v9,  0x200000003uLL,  (void *)0x4080001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C600000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v9.msgh_local_port);
      return v7;
    }

    if (v9.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v9.msgh_id == 4906)
    {
      int64_t v7 = -300;
      if ((v9.msgh_bits & 0x80000000) == 0 && *(void *)&v9.msgh_size == 36LL)
      {
        int64_t v7 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v9);
  }

  return v7;
}

kern_return_t vm_copy( vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  vm_address_t v12;
  vm_size_t v13;
  vm_address_t v14;
  int v11 = NDR_record;
  int v12 = source_address;
  unsigned int v13 = size;
  mach_msg_header_t v14 = dest_address;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C700000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C700000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4907)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t vm_read_overwrite( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_address_t data, vm_size_t *outsize)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_header_t v13;
  NDR_record_t v14;
  __int128 v15;
  vm_address_t v16;
  mach_msg_header_t v14 = NDR_record;
  *(void *)&__int128 v15 = address;
  *((void *)&v15 + 1) = size;
  uint64_t v16 = data;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12C800000000LL;
  uint64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C800000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  int64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      int64_t v9 = -308;
    }

    else if (v13.msgh_id == 4908)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 44)
        {
          if (!v13.msgh_remote_port)
          {
            int64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *outsize = *(void *)((char *)&v15 + 4);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            int v11 = 1;
          }
          else {
            int v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            int64_t v9 = -300;
          }
          else {
            int64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      int64_t v9 = -300;
    }

    else
    {
      int64_t v9 = -301;
    }

kern_return_t vm_msync(vm_map_t target_task, vm_address_t address, vm_size_t size, vm_sync_t sync_flags)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  vm_address_t v12;
  vm_size_t v13;
  vm_sync_t v14;
  int v11 = NDR_record;
  int v12 = address;
  unsigned int v13 = size;
  mach_msg_header_t v14 = sync_flags;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12C900000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12C900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4909)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

kern_return_t vm_behavior_set( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_behavior_t new_behavior)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  NDR_record_t v11;
  vm_address_t v12;
  vm_size_t v13;
  vm_behavior_t v14;
  int v11 = NDR_record;
  int v12 = address;
  unsigned int v13 = size;
  mach_msg_header_t v14 = new_behavior;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3400001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x12CA00000000LL;
  uint64_t v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3400001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CA00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  int64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      int64_t v7 = -308;
    }

    else if (v10.msgh_id == 4910)
    {
      int64_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        int64_t v7 = v12;
        if (!(_DWORD)v12) {
          return v7;
        }
      }
    }

    else
    {
      int64_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t _kernelrpc_vm_map( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, uint64_t a9, int a10)
{
  int v19 = 1;
  int v20 = a6;
  v22[0] = 1245184;
  uint64_t v12 = *a2;
  *(NDR_record_t *)&v22[1] = NDR_record;
  *(void *)&v22[3] = v12;
  *(void *)&v22[5] = a3;
  *(void *)&v22[7] = a4;
  v22[9] = a5;
  uint64_t v23 = a7;
  int v24 = a8;
  uint64_t v25 = a9;
  int v26 = a10;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v18.mach_msg_bits_t msgh_bits = 0x6480001513LL;
  *(void *)&v18.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v18.uint64_t msgh_voucher_port = 0x12CB00000000LL;
  int64_t v14 = mach_msg2_internal( &v18,  0x200000003uLL,  (void *)0x6480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12CB00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x34,  0LL);
  uint64_t v15 = v14;
  if ((v14 - 268435458) > 0xE || ((1 << (v14 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v14)
    {
      if (v18.msgh_id == 71)
      {
        uint64_t v15 = 4294966988LL;
      }

      else if (v18.msgh_id == 4911)
      {
        if ((v18.msgh_bits & 0x80000000) == 0)
        {
          if (v18.msgh_size == 44)
          {
            if (!v18.msgh_remote_port)
            {
              uint64_t v15 = v21;
              if (!v21)
              {
                *a2 = *(void *)v22;
                return v15;
              }

              goto LABEL_20;
            }
          }

          else if (v18.msgh_size == 36)
          {
            if (v18.msgh_remote_port) {
              BOOL v16 = 1;
            }
            else {
              BOOL v16 = v21 == 0;
            }
            if (v16) {
              uint64_t v15 = 4294966996LL;
            }
            else {
              uint64_t v15 = v21;
            }
            goto LABEL_20;
          }
        }

        uint64_t v15 = 4294966996LL;
      }

      else
      {
        uint64_t v15 = 4294966995LL;
      }

kern_return_t vm_machine_attribute( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_machine_attribute_t attribute, vm_machine_attribute_val_t *value)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_header_t v14;
  NDR_record_t v15;
  vm_address_t v16;
  vm_size_t v17;
  vm_machine_attribute_t v18;
  vm_machine_attribute_val_t v19;
  uint64_t v15 = NDR_record;
  BOOL v16 = address;
  int v17 = size;
  vm_machine_attribute_val_t v7 = *value;
  mach_msg_header_t v18 = attribute;
  int v19 = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x3800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12CC00000000LL;
  int64_t v9 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x3800001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CC00000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v10;
    }

    if (v14.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v14.msgh_id == 4912)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 40)
        {
          if (!v14.msgh_remote_port)
          {
            uint64_t v10 = v16;
            if (!(_DWORD)v16)
            {
              *value = HIDWORD(v16);
              return v10;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = (_DWORD)v16 == 0;
          }
          if (v12) {
            uint64_t v10 = -300;
          }
          else {
            uint64_t v10 = v16;
          }
          goto LABEL_23;
        }
      }

      uint64_t v10 = -300;
    }

    else
    {
      uint64_t v10 = -301;
    }

uint64_t _kernelrpc_vm_remap( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, _DWORD *a9, _DWORD *a10, int a11)
{
  int v21 = 1;
  int v22 = a6;
  *(_DWORD *)int v24 = 1245184;
  uint64_t v13 = *a2;
  *(NDR_record_t *)&v24[4] = NDR_record;
  uint64_t v25 = v13;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  int v28 = a5;
  uint64_t v29 = a7;
  int v30 = a8;
  int v31 = a11;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v20.mach_msg_bits_t msgh_bits = 0x5C80001513LL;
  *(void *)&v20.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v20.uint64_t msgh_voucher_port = 0x12CD00000000LL;
  int64_t v15 = mach_msg2_internal( &v20,  0x200000003uLL,  (void *)0x5C80001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12CD00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v15)
    {
      if (v20.msgh_id == 71)
      {
        uint64_t v16 = 4294966988LL;
      }

      else if (v20.msgh_id == 4913)
      {
        if ((v20.msgh_bits & 0x80000000) == 0)
        {
          if (v20.msgh_size == 52)
          {
            if (!v20.msgh_remote_port)
            {
              uint64_t v16 = v23;
              if (!v23)
              {
                *a2 = *(void *)v24;
                int v19 = v25;
                *a9 = *(_DWORD *)&v24[8];
                *a10 = v19;
                return v16;
              }

              goto LABEL_20;
            }
          }

          else if (v20.msgh_size == 36)
          {
            if (v20.msgh_remote_port) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = v23 == 0;
            }
            if (v17) {
              uint64_t v16 = 4294966996LL;
            }
            else {
              uint64_t v16 = v23;
            }
            goto LABEL_20;
          }
        }

        uint64_t v16 = 4294966996LL;
      }

      else
      {
        uint64_t v16 = 4294966995LL;
      }

kern_return_t vm_map_page_query( vm_map_t target_map, vm_offset_t offset, integer_t *disposition, integer_t *ref_count)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  integer_t v13;
  mach_msg_header_t v14;
  NDR_record_t v15;
  vm_offset_t v16;
  integer_t v17;
  int64_t v15 = NDR_record;
  uint64_t v16 = offset;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_map);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12CE00000000LL;
  uint64_t v8 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, target_map),  (void *)0x12CE00000000LL,  (void *)(reply_port << 32),  (void *)0x34,  0LL);
  int64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v9;
    }

    if (v14.msgh_id == 71)
    {
      int64_t v9 = -308;
    }

    else if (v14.msgh_id == 4914)
    {
      if ((v14.msgh_bits & 0x80000000) == 0)
      {
        if (v14.msgh_size == 44)
        {
          if (!v14.msgh_remote_port)
          {
            int64_t v9 = v16;
            if (!(_DWORD)v16)
            {
              uint64_t v13 = v17;
              *disposition = HIDWORD(v16);
              *ref_count = v13;
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v14.msgh_size == 36)
        {
          if (v14.msgh_remote_port) {
            int v11 = 1;
          }
          else {
            int v11 = (_DWORD)v16 == 0;
          }
          if (v11) {
            int64_t v9 = -300;
          }
          else {
            int64_t v9 = v16;
          }
          goto LABEL_23;
        }
      }

      int64_t v9 = -300;
    }

    else
    {
      int64_t v9 = -301;
    }

kern_return_t vm_region_recurse_64( vm_map_t target_task, vm_address_t *address, vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  kern_return_t v15;
  kern_return_t v16;
  BOOL v17;
  mach_msg_type_number_t v20;
  size_t v21;
  uint64_t v22;
  mach_msg_header_t v23;
  NDR_record_t v24;
  _BYTE v25[12];
  vm_size_t v26;
  natural_t v27;
  mach_msg_size_t v28;
  _BYTE v29[84];
  vm_address_t v12 = *address;
  int v24 = NDR_record;
  *(void *)uint64_t v25 = v12;
  mach_msg_type_number_t v13 = *infoCnt;
  if (*infoCnt >= 0x13) {
    mach_msg_type_number_t v13 = 19;
  }
  *(_DWORD *)&v25[8] = *nesting_depth;
  LODWORD(v26) = v13;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v23.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v23.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v23.uint64_t msgh_voucher_port = 0x12CF00000000LL;
  int64_t v15 = mach_msg2_internal( &v23,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12CF00000000LL,  (void *)(reply_port << 32),  (void *)0x90,  0LL);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (v15)
    {
      mig_dealloc_reply_port(v23.msgh_local_port);
      return v16;
    }

    if (v23.msgh_id == 71)
    {
      uint64_t v16 = -308;
    }

    else if (v23.msgh_id == 4915)
    {
      if ((v23.msgh_bits & 0x80000000) == 0)
      {
        if (v23.msgh_size - 137 <= 0xFFFFFFB2)
        {
          if (v23.msgh_remote_port) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = *(_DWORD *)v25 == 0;
          }
          if (!v17 && v23.msgh_size == 36) {
            uint64_t v16 = *(_DWORD *)v25;
          }
          else {
            uint64_t v16 = -300;
          }
          goto LABEL_24;
        }

        if (!v23.msgh_remote_port)
        {
          uint64_t v16 = *(_DWORD *)v25;
          if (*(_DWORD *)v25) {
            goto LABEL_24;
          }
          mach_msg_header_t v20 = v28;
          if (v28 <= 0x13 && v28 <= (v23.msgh_size - 60) >> 2)
          {
            int v21 = 4LL * v28;
            if (v23.msgh_size == 4 * v28 + 60)
            {
              *mach_vm_address_t address = *(void *)&v25[4];
              *size = v26;
              *nesting_depth = v27;
              int v22 = *infoCnt;
              if (v20 <= v22)
              {
                memmove(info, v29, v21);
                uint64_t v16 = 0;
                *infoCnt = v20;
              }

              else
              {
                memmove(info, v29, 4 * v22);
                *infoCnt = v20;
                return -307;
              }

              return v16;
            }
          }
        }
      }

      uint64_t v16 = -300;
    }

    else
    {
      uint64_t v16 = -301;
    }

kern_return_t vm_region_64( vm_map_t target_task, vm_address_t *address, vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  kern_return_t v16;
  kern_return_t v17;
  mach_msg_type_number_t v19;
  size_t v20;
  vm_size_t v21;
  uint64_t v22;
  mach_msg_header_t v24;
  NDR_record_t v25;
  vm_address_t v26;
  vm_region_flavor_t v27;
  mach_msg_type_number_t v28;
  vm_address_t v29;
  vm_size_t v30;
  mach_msg_size_t v31;
  _BYTE v32[52];
  vm_address_t v13 = *address;
  uint64_t v25 = NDR_record;
  uint64_t v26 = v13;
  mach_msg_type_number_t v14 = *infoCnt;
  if (*infoCnt >= 0xA) {
    mach_msg_type_number_t v14 = 10;
  }
  uint64_t v27 = flavor;
  int v28 = v14;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v24.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v24.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v24.uint64_t msgh_voucher_port = 0x12D000000000LL;
  uint64_t v16 = mach_msg2_internal( &v24,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D000000000LL,  (void *)(reply_port << 32),  (void *)0x74,  0LL);
  BOOL v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (v16)
    {
      mig_dealloc_reply_port(v24.msgh_local_port);
      return v17;
    }

    if (v24.msgh_id == 71)
    {
      BOOL v17 = -308;
    }

    else if (v24.msgh_id == 4916)
    {
      if ((v24.msgh_bits & 0x80000000) != 0)
      {
        BOOL v17 = -300;
        if (*(_DWORD *)&v25.mig_vers == 1
          && v24.msgh_size >= 0x44
          && v24.msgh_size <= 0x6C
          && !v24.msgh_remote_port
          && HIWORD(v26) << 16 == 1114112)
        {
          int v19 = v31;
          if (v31 <= 0xA && v31 <= (v24.msgh_size - 68) >> 2)
          {
            mach_msg_header_t v20 = 4LL * v31;
            if (v24.msgh_size == 4 * v31 + 68)
            {
              int v21 = v30;
              *mach_vm_address_t address = v29;
              *size = v21;
              int v22 = *infoCnt;
              if (v19 <= v22)
              {
                memmove(info, v32, v20);
                BOOL v17 = 0;
                *infoCnt = v19;
                *object_mach_port_name_t name = *(_DWORD *)&v25.int_rep;
              }

              else
              {
                memmove(info, v32, 4 * v22);
                *infoCnt = v19;
                return -307;
              }

              return v17;
            }
          }
        }
      }

      else if (v24.msgh_size == 36)
      {
        BOOL v17 = -300;
        if ((_DWORD)v26)
        {
          if (v24.msgh_remote_port) {
            BOOL v17 = -300;
          }
          else {
            BOOL v17 = v26;
          }
        }
      }

      else
      {
        BOOL v17 = -300;
      }
    }

    else
    {
      BOOL v17 = -301;
    }

    mach_msg_destroy(&v24);
  }

  return v17;
}

kern_return_t mach_make_memory_entry_64( vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  kern_return_t v11;
  kern_return_t v12;
  mach_msg_header_t v14;
  int v15;
  mem_entry_name_port_t v16;
  kern_return_t v17;
  int v18;
  NDR_record_t v19;
  memory_object_size_t v20;
  memory_object_offset_t v21;
  vm_prot_t v22;
  int64_t v15 = 1;
  uint64_t v16 = parent_entry;
  mach_msg_header_t v18 = 1245184;
  memory_object_size_t v9 = *size;
  int v19 = NDR_record;
  mach_msg_header_t v20 = v9;
  int v21 = offset;
  int v22 = permission;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x4480001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, target_task);
  *(void *)&v14.uint64_t msgh_voucher_port = 0x12D100000000LL;
  int v11 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x4480001513LL,  (void *)__PAIR64__(reply_port, target_task),  (void *)0x12D100000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x40,  0LL);
  vm_address_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v14.msgh_id == 71)
      {
        vm_address_t v12 = -308;
      }

      else if (v14.msgh_id == 4917)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            vm_address_t v12 = -300;
            if (v17)
            {
              if (v14.msgh_remote_port) {
                vm_address_t v12 = -300;
              }
              else {
                vm_address_t v12 = v17;
              }
            }
          }

          else
          {
            vm_address_t v12 = -300;
          }

          goto LABEL_21;
        }

        vm_address_t v12 = -300;
        if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIWORD(v18) << 16 == 1114112)
        {
          vm_address_t v12 = 0;
          *size = v20;
          *object_handle = v16;
          return v12;
        }
      }

      else
      {
        vm_address_t v12 = -301;
      }

uint64_t _kernelrpc_vm_purgable_control(unsigned int a1, uint64_t a2, int a3, int *a4)
{
  NDR_record_t v14 = NDR_record;
  uint64_t v15 = a2;
  int v6 = *a4;
  int v16 = a3;
  int v17 = v6;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v13.mach_msg_bits_t msgh_bits = 0x3000001513LL;
  *(void *)&v13.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v13.uint64_t msgh_voucher_port = 0x12D200000000LL;
  int64_t v8 = mach_msg2_internal( &v13,  0x200000003uLL,  (void *)0x3000001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D200000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v13.msgh_local_port);
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 4918)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!(_DWORD)v15)
            {
              *a4 = HIDWORD(v15);
              return v9;
            }

            goto LABEL_23;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = (_DWORD)v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_23;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _kernelrpc_vm_remap_new( unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, int *a9, int *a10, int a11)
{
  int v22 = 1;
  int v23 = a6;
  *(_DWORD *)uint64_t v25 = 1245184;
  uint64_t v13 = *a2;
  *(NDR_record_t *)&v25[4] = NDR_record;
  uint64_t v26 = v13;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  int v29 = a5;
  uint64_t v30 = a7;
  int v14 = *a9;
  int v31 = a8;
  int v32 = v14;
  int v33 = *a10;
  int v34 = a11;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v21.mach_msg_bits_t msgh_bits = 0x6480001513LL;
  *(void *)&v21.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v21.uint64_t msgh_voucher_port = 0x12D500000000LL;
  int64_t v16 = mach_msg2_internal( &v21,  0x200000003uLL,  (void *)0x6480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x12D500000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x3C,  0LL);
  uint64_t v17 = v16;
  if ((v16 - 268435458) > 0xE || ((1 << (v16 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v16)
    {
      if (v21.msgh_id == 71)
      {
        uint64_t v17 = 4294966988LL;
      }

      else if (v21.msgh_id == 4921)
      {
        if ((v21.msgh_bits & 0x80000000) == 0)
        {
          if (v21.msgh_size == 52)
          {
            if (!v21.msgh_remote_port)
            {
              uint64_t v17 = v24;
              if (!v24)
              {
                *a2 = *(void *)v25;
                int v20 = v26;
                *a9 = *(_DWORD *)&v25[8];
                *a10 = v20;
                return v17;
              }

              goto LABEL_20;
            }
          }

          else if (v21.msgh_size == 36)
          {
            if (v21.msgh_remote_port) {
              BOOL v18 = 1;
            }
            else {
              BOOL v18 = v24 == 0;
            }
            if (v18) {
              uint64_t v17 = 4294966996LL;
            }
            else {
              uint64_t v17 = v24;
            }
            goto LABEL_20;
          }
        }

        uint64_t v17 = 4294966996LL;
      }

      else
      {
        uint64_t v17 = 4294966995LL;
      }

uint64_t task_restartable_ranges_register(unsigned int a1, const void *a2, unsigned int a3)
{
  NDR_record_t v11 = NDR_record;
  if (a3 > 0x40) {
    return 4294966989LL;
  }
  int v6 = 16 * a3;
  memmove(&v13, a2, 16 * a3);
  unsigned int v12 = a3;
  uint64_t reply_port = mig_get_reply_port();
  v10.mach_msg_bits_t msgh_bits = 5395;
  v10.msgh_size = v6 + 36;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x1F4000000000LL;
  int64_t v8 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)(((unint64_t)(v6 + 36) << 32) | 0x1513),  (void *)__PAIR64__(reply_port, a1),  (void *)0x1F4000000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v3 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v3;
    }

    if (v10.msgh_id == 71)
    {
      uint64_t v3 = 4294966988LL;
    }

    else if (v10.msgh_id == 8100)
    {
      uint64_t v3 = 4294966996LL;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        uint64_t v3 = v12;
        if (!v12) {
          return v3;
        }
      }
    }

    else
    {
      uint64_t v3 = 4294966995LL;
    }

    mach_msg_destroy(&v10);
  }

  return v3;
}

uint64_t task_restartable_ranges_synchronize(unsigned int a1)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001513LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v7.uint64_t msgh_voucher_port = 0x1F4100000000LL;
  int64_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x1F4100000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (v7.msgh_id == 8101)
    {
      uint64_t v4 = 4294966996LL;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        uint64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

kern_return_t mach_memory_entry_purgable_control( mem_entry_name_port_t mem_entry, vm_purgable_t control, int *state)
{
  kern_return_t v7;
  kern_return_t v8;
  BOOL v10;
  mach_msg_header_t v12;
  NDR_record_t v13;
  vm_purgable_t v14;
  int v15;
  uint64_t v13 = NDR_record;
  int v5 = *state;
  int v14 = control;
  uint64_t v15 = v5;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, mem_entry);
  *(void *)&v12.uint64_t msgh_voucher_port = 0x132400000000LL;
  mach_msg_header_t v7 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, mem_entry),  (void *)0x132400000000LL,  (void *)(reply_port << 32),  (void *)0x30,  0LL);
  unsigned int v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v8;
    }

    if (v12.msgh_id == 71)
    {
      unsigned int v8 = -308;
    }

    else if (v12.msgh_id == 5000)
    {
      if ((v12.msgh_bits & 0x80000000) == 0)
      {
        if (v12.msgh_size == 40)
        {
          if (!v12.msgh_remote_port)
          {
            unsigned int v8 = v14;
            if (!v14)
            {
              *state = v15;
              return v8;
            }

            goto LABEL_23;
          }
        }

        else if (v12.msgh_size == 36)
        {
          if (v12.msgh_remote_port) {
            mach_msg_header_t v10 = 1;
          }
          else {
            mach_msg_header_t v10 = v14 == 0;
          }
          if (v10) {
            unsigned int v8 = -300;
          }
          else {
            unsigned int v8 = v14;
          }
          goto LABEL_23;
        }
      }

      unsigned int v8 = -300;
    }

    else
    {
      unsigned int v8 = -301;
    }

kern_return_t mach_memory_entry_access_tracking( mem_entry_name_port_t mem_entry, int *access_tracking, uint32_t *access_tracking_reads, uint32_t *access_tracking_writes)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  uint32_t v14;
  mach_msg_header_t v15;
  NDR_record_t v16;
  int v17;
  int v18;
  uint32_t v19;
  uint32_t v20;
  int64_t v16 = NDR_record;
  uint64_t v17 = *access_tracking;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v15.msgh_remote_port = __PAIR64__(reply_port, mem_entry);
  *(void *)&v15.uint64_t msgh_voucher_port = 0x132500000000LL;
  uint64_t v9 = mach_msg2_internal( &v15,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, mem_entry),  (void *)0x132500000000LL,  (void *)(reply_port << 32),  (void *)0x38,  0LL);
  mach_msg_header_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v15.msgh_local_port);
      return v10;
    }

    if (v15.msgh_id == 71)
    {
      mach_msg_header_t v10 = -308;
    }

    else if (v15.msgh_id == 5001)
    {
      if ((v15.msgh_bits & 0x80000000) == 0)
      {
        if (v15.msgh_size == 48)
        {
          if (!v15.msgh_remote_port)
          {
            mach_msg_header_t v10 = v17;
            if (!v17)
            {
              int v14 = v19;
              *access_tracking = v18;
              *access_tracking_reads = v14;
              *access_tracking_writes = v20;
              return v10;
            }

            goto LABEL_23;
          }
        }

        else if (v15.msgh_size == 36)
        {
          if (v15.msgh_remote_port) {
            unsigned int v12 = 1;
          }
          else {
            unsigned int v12 = v17 == 0;
          }
          if (v12) {
            mach_msg_header_t v10 = -300;
          }
          else {
            mach_msg_header_t v10 = v17;
          }
          goto LABEL_23;
        }
      }

      mach_msg_header_t v10 = -300;
    }

    else
    {
      mach_msg_header_t v10 = -301;
    }

kern_return_t mach_memory_entry_ownership( mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  kern_return_t v6;
  kern_return_t v7;
  mach_msg_header_t v10;
  int v11;
  task_t v12;
  kern_return_t v13;
  int v14;
  NDR_record_t v15;
  int v16;
  int v17;
  NDR_record_t v11 = 1;
  unsigned int v12 = owner;
  int v14 = 1245184;
  uint64_t v15 = NDR_record;
  int64_t v16 = ledger_tag;
  uint64_t v17 = ledger_flags;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 0x3880001513LL;
  *(void *)&v10.msgh_remote_port = __PAIR64__(reply_port, mem_entry);
  *(void *)&v10.uint64_t msgh_voucher_port = 0x132600000000LL;
  int v6 = mach_msg2_internal( &v10,  0x200000003uLL,  (void *)0x3880001513LL,  (void *)__PAIR64__(reply_port, mem_entry),  (void *)0x132600000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  mach_msg_header_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }

    if (v10.msgh_id == 71)
    {
      mach_msg_header_t v7 = -308;
    }

    else if (v10.msgh_id == 5002)
    {
      mach_msg_header_t v7 = -300;
      if ((v10.msgh_bits & 0x80000000) == 0 && v10.msgh_size == 36 && !v10.msgh_remote_port)
      {
        mach_msg_header_t v7 = v13;
        if (!v13) {
          return v7;
        }
      }
    }

    else
    {
      mach_msg_header_t v7 = -301;
    }

    mach_msg_destroy(&v10);
  }

  return v7;
}

uint64_t mach_eventlink_create(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  NDR_record_t v15 = NDR_record;
  unsigned int v16 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v14.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v14.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v14.uint64_t msgh_voucher_port = 0xAEDA800000000LL;
  int64_t v6 = mach_msg2_internal( &v14,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xAEDA800000000LL,  (void *)(reply_port << 32),  (void *)0x3C,  0LL);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_reply_port(v14.msgh_local_port);
      return v7;
    }

    if (v14.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (v14.msgh_id == 716300)
    {
      if ((v14.msgh_bits & 0x80000000) != 0)
      {
        uint64_t v7 = 4294966996LL;
        if (*(_DWORD *)&v15.mig_vers != 2 || *(void *)&v14.msgh_size != 52LL) {
          goto LABEL_25;
        }
        uint64_t v9 = v17;
        for (char i = 1; ; char i = 0)
        {
          char v11 = i;
          v9 += 3;
          if ((v11 & 1) == 0)
          {
            uint64_t v7 = 0LL;
            int v12 = v17[1];
            *a3 = *(_DWORD *)&v15.int_rep;
            a3[1] = v12;
            return v7;
          }
        }
      }

      else if (v14.msgh_size == 36)
      {
        uint64_t v7 = 4294966996LL;
        if (v16)
        {
          if (v14.msgh_remote_port) {
            uint64_t v7 = 4294966996LL;
          }
          else {
            uint64_t v7 = v16;
          }
        }

        goto LABEL_25;
      }

      uint64_t v7 = 4294966996LL;
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

uint64_t mach_eventlink_destroy(unsigned int a1)
{
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v7.mach_msg_bits_t msgh_bits = 0x1800001511LL;
  *(void *)&v7.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v7.uint64_t msgh_voucher_port = 0xAEDA900000000LL;
  int64_t v3 = mach_msg2_internal( &v7,  0x200000003uLL,  (void *)0x1800001511LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xAEDA900000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
      return v4;
    }

    if (v7.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (v7.msgh_id == 716301)
    {
      uint64_t v4 = 4294966996LL;
      if ((v7.msgh_bits & 0x80000000) == 0 && *(void *)&v7.msgh_size == 36LL)
      {
        uint64_t v4 = v8;
        if (!v8) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&v7);
  }

  return v4;
}

uint64_t mach_eventlink_associate( unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v13 = 1;
  int v14 = a2;
  int v16 = 1245184;
  NDR_record_t v17 = NDR_record;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  int v22 = a7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v12.mach_msg_bits_t msgh_bits = 0x5480001513LL;
  *(void *)&v12.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v12.uint64_t msgh_voucher_port = 0xAEDAA00000000LL;
  int64_t v9 = mach_msg2_internal( &v12,  0x200000003uLL,  (void *)0x5480001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xAEDAA00000000LL,  (void *)((reply_port << 32) | 1),  (void *)0x2C,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v12.msgh_local_port);
      return v10;
    }

    if (v12.msgh_id == 71)
    {
      uint64_t v10 = 4294966988LL;
    }

    else if (v12.msgh_id == 716302)
    {
      uint64_t v10 = 4294966996LL;
      if ((v12.msgh_bits & 0x80000000) == 0 && v12.msgh_size == 36 && !v12.msgh_remote_port)
      {
        uint64_t v10 = v15;
        if (!v15) {
          return v10;
        }
      }
    }

    else
    {
      uint64_t v10 = 4294966995LL;
    }

    mach_msg_destroy(&v12);
  }

  return v10;
}

uint64_t mach_eventlink_disassociate(unsigned int a1, unsigned int a2)
{
  NDR_record_t v9 = NDR_record;
  unsigned int v10 = a2;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v8.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v8.uint64_t msgh_voucher_port = 0xAEDAB00000000LL;
  int64_t v4 = mach_msg2_internal( &v8,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0xAEDAB00000000LL,  (void *)(reply_port << 32),  (void *)0x2C,  0LL);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_reply_port(v8.msgh_local_port);
      return v5;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (v8.msgh_id == 716303)
    {
      uint64_t v5 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v5 = v10;
        if (!v10) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v5;
}

kern_return_t mach_voucher_extract_attr_content( ipc_voucher_t voucher, mach_voucher_attr_key_t key, mach_voucher_attr_content_t content, mach_msg_type_number_t *contentCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  size_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  mach_voucher_attr_key_t v19;
  mach_msg_size_t __n;
  _BYTE __n_4[4104];
  uint64_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *contentCnt;
  if (*contentCnt >= 0x1000) {
    mach_msg_type_number_t v7 = 4096;
  }
  uint64_t v19 = key;
  mach_msg_size_t __n = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, voucher);
  *(void *)&v17.uint64_t msgh_voucher_port = 0x151800000000LL;
  NDR_record_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, voucher),  (void *)0x151800000000LL,  (void *)(reply_port << 32),  (void *)0x1030,  0LL);
  unsigned int v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      unsigned int v10 = -308;
    }

    else if (v17.msgh_id == 5500)
    {
      if ((v17.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v17.msgh_size - 4137 <= 0xFFFFEFFE)
      {
        if (v17.msgh_remote_port) {
          mach_msg_header_t v12 = 1;
        }
        else {
          mach_msg_header_t v12 = v19 == 0;
        }
        if (!v12 && v17.msgh_size == 36) {
          unsigned int v10 = v19;
        }
        else {
          unsigned int v10 = -300;
        }
        goto LABEL_27;
      }

      if (v17.msgh_remote_port)
      {
LABEL_26:
        unsigned int v10 = -300;
      }

      else
      {
        unsigned int v10 = v19;
        if (!v19)
        {
          unsigned int v15 = __n;
          unsigned int v10 = -300;
          if (__n <= 0x1000 && v17.msgh_size - 40 >= __n && v17.msgh_size == ((__n + 3) & 0xFFFFFFFC) + 40)
          {
            int v16 = *contentCnt;
            if (__n <= v16)
            {
              memmove(content, __n_4, __n);
              unsigned int v10 = 0;
              *contentCnt = v15;
            }

            else
            {
              memmove(content, __n_4, v16);
              *contentCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }
    }

    else
    {
      unsigned int v10 = -301;
    }

uint64_t _kernelrpc_mach_voucher_extract_attr_recipe(unsigned int a1, unsigned int a2, void *a3, int *a4)
{
  NDR_record_t v18 = NDR_record;
  int v7 = *a4;
  unsigned int v19 = a2;
  mach_msg_size_t __n = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, a1);
  *(void *)&v17.uint64_t msgh_voucher_port = 0x151900000000LL;
  int64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, a1),  (void *)0x151900000000LL,  (void *)(reply_port << 32),  (void *)0x1030,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = 4294966988LL;
    }

    else if (v17.msgh_id == 5501)
    {
      if ((v17.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v17.msgh_size - 4137 <= 0xFFFFEFFE)
      {
        if (v17.msgh_remote_port) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v19 == 0;
        }
        if (!v12 && v17.msgh_size == 36) {
          uint64_t v10 = v19;
        }
        else {
          uint64_t v10 = 4294966996LL;
        }
        goto LABEL_27;
      }

      if (v17.msgh_remote_port)
      {
LABEL_26:
        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = v19;
        if (!v19)
        {
          mach_msg_size_t v15 = __n;
          uint64_t v10 = 4294966996LL;
          if (__n <= 0x1000 && v17.msgh_size - 40 >= __n && v17.msgh_size == ((__n + 3) & 0xFFFFFFFC) + 40)
          {
            size_t v16 = *a4;
            if (__n <= v16)
            {
              memmove(a3, __n_4, __n);
              uint64_t v10 = 0LL;
              *a4 = v15;
            }

            else
            {
              memmove(a3, __n_4, v16);
              *a4 = v15;
              return 4294966989LL;
            }

            return v10;
          }
        }
      }
    }

    else
    {
      uint64_t v10 = 4294966995LL;
    }

kern_return_t mach_voucher_extract_all_attr_recipes( ipc_voucher_t voucher, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t *recipesCnt)
{
  kern_return_t v8;
  kern_return_t v9;
  BOOL v11;
  mach_msg_type_number_t v14;
  size_t v15;
  mach_msg_header_t v16;
  NDR_record_t v17;
  mach_msg_type_number_t v18;
  mach_msg_size_t __n;
  _BYTE __n_4[5128];
  mach_msg_header_t v17 = NDR_record;
  mach_msg_type_number_t v6 = *recipesCnt;
  if (*recipesCnt >= 0x1400) {
    mach_msg_type_number_t v6 = 5120;
  }
  NDR_record_t v18 = v6;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v16.mach_msg_bits_t msgh_bits = 0x2400001513LL;
  *(void *)&v16.msgh_remote_port = __PAIR64__(reply_port, voucher);
  *(void *)&v16.uint64_t msgh_voucher_port = 0x151A00000000LL;
  mach_msg_header_t v8 = mach_msg2_internal( &v16,  0x200000003uLL,  (void *)0x2400001513LL,  (void *)__PAIR64__(reply_port, voucher),  (void *)0x151A00000000LL,  (void *)(reply_port << 32),  (void *)0x1430,  0LL);
  int64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(v16.msgh_local_port);
      return v9;
    }

    if (v16.msgh_id == 71)
    {
      int64_t v9 = -308;
    }

    else if (v16.msgh_id == 5502)
    {
      if ((v16.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v16.msgh_size - 5161 <= 0xFFFFEBFE)
      {
        if (v16.msgh_remote_port) {
          char v11 = 1;
        }
        else {
          char v11 = v18 == 0;
        }
        if (!v11 && v16.msgh_size == 36) {
          int64_t v9 = v18;
        }
        else {
          int64_t v9 = -300;
        }
        goto LABEL_27;
      }

      if (v16.msgh_remote_port)
      {
LABEL_26:
        int64_t v9 = -300;
      }

      else
      {
        int64_t v9 = v18;
        if (!v18)
        {
          int v14 = __n;
          int64_t v9 = -300;
          if (__n <= 0x1400 && v16.msgh_size - 40 >= __n && v16.msgh_size == ((__n + 3) & 0xFFFFFFFC) + 40)
          {
            mach_msg_size_t v15 = *recipesCnt;
            if (__n <= v15)
            {
              memmove(recipes, __n_4, __n);
              int64_t v9 = 0;
              *recipesCnt = v14;
            }

            else
            {
              memmove(recipes, __n_4, v15);
              *recipesCnt = v14;
              return -307;
            }

            return v9;
          }
        }
      }
    }

    else
    {
      int64_t v9 = -301;
    }

kern_return_t mach_voucher_attr_command( ipc_voucher_t voucher, mach_voucher_attr_key_t key, mach_voucher_attr_command_t command, mach_voucher_attr_content_t in_content, mach_msg_type_number_t in_contentCnt, mach_voucher_attr_content_t out_content, mach_msg_type_number_t *out_contentCnt)
{
  kern_return_t v7;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  mach_msg_type_number_t v15;
  uint64_t reply_port;
  kern_return_t v17;
  BOOL v18;
  mach_msg_type_number_t v21;
  size_t v22;
  mach_msg_header_t v23;
  NDR_record_t v24;
  mach_voucher_attr_key_t v25;
  mach_voucher_attr_command_t __n;
  mach_msg_type_number_t __n_4;
  int v28;
  unsigned int v24 = NDR_record;
  uint64_t v25 = key;
  mach_msg_size_t __n = command;
  if (in_contentCnt > 0x1000) {
    return -307;
  }
  memmove(&v28, in_content, in_contentCnt);
  __n_4 = in_contentCnt;
  BOOL v12 = (in_contentCnt + 3) & 0xFFFFFFFC;
  int v13 = (v12 + 48);
  int v14 = (char *)&v23 + v12;
  mach_msg_size_t v15 = *out_contentCnt;
  if (*out_contentCnt >= 0x1000) {
    mach_msg_size_t v15 = 4096;
  }
  *((_DWORD *)v14 + 11) = v15;
  uint64_t reply_port = mig_get_reply_port();
  v23.mach_msg_bits_t msgh_bits = 5395;
  v23.msgh_size = v13;
  *(void *)&v23.msgh_remote_port = __PAIR64__(reply_port, voucher);
  *(void *)&v23.uint64_t msgh_voucher_port = 0x151B00000000LL;
  mach_msg_header_t v17 = mach_msg2_internal( &v23,  0x200000003uLL,  (void *)(((unint64_t)(v13 >> 2) << 34) | 0x1513),  (void *)__PAIR64__(reply_port, voucher),  (void *)0x151B00000000LL,  (void *)(reply_port << 32),  (void *)0x1030,  0LL);
  int v7 = v17;
  if ((v17 - 268435458) > 0xE || ((1 << (v17 - 2)) & 0x4003) == 0)
  {
    if (v17)
    {
      mig_dealloc_reply_port(v23.msgh_local_port);
      return v7;
    }

    if (v23.msgh_id == 71)
    {
      int v7 = -308;
    }

    else if (v23.msgh_id == 5503)
    {
      if ((v23.msgh_bits & 0x80000000) != 0) {
        goto LABEL_25;
      }
      if (v23.msgh_size - 4137 <= 0xFFFFEFFE)
      {
        if (v23.msgh_remote_port) {
          NDR_record_t v18 = 1;
        }
        else {
          NDR_record_t v18 = v25 == 0;
        }
        if (!v18 && v23.msgh_size == 36) {
          int v7 = v25;
        }
        else {
          int v7 = -300;
        }
        goto LABEL_26;
      }

      if (v23.msgh_remote_port)
      {
LABEL_25:
        int v7 = -300;
      }

      else
      {
        int v7 = v25;
        if (!v25)
        {
          uint64_t v21 = __n;
          int v7 = -300;
          if (__n <= 0x1000 && v23.msgh_size - 40 >= __n && v23.msgh_size == ((__n + 3) & 0xFFFFFFFC) + 40)
          {
            int v22 = *out_contentCnt;
            if (__n <= v22)
            {
              memmove(out_content, &__n_4, __n);
              int v7 = 0;
              *out_contentCnt = v21;
              return v7;
            }

            memmove(out_content, &__n_4, v22);
            *out_contentCnt = v21;
            return -307;
          }
        }
      }
    }

    else
    {
      int v7 = -301;
    }

kern_return_t mach_voucher_debug_info( ipc_space_t task, mach_port_name_t voucher_name, mach_voucher_attr_raw_recipe_array_t recipes, mach_msg_type_number_t *recipesCnt)
{
  kern_return_t v9;
  kern_return_t v10;
  BOOL v12;
  mach_msg_type_number_t v15;
  size_t v16;
  mach_msg_header_t v17;
  NDR_record_t v18;
  mach_port_name_t v19;
  mach_msg_size_t __n;
  _BYTE __n_4[5128];
  NDR_record_t v18 = NDR_record;
  mach_msg_type_number_t v7 = *recipesCnt;
  if (*recipesCnt >= 0x1400) {
    mach_msg_type_number_t v7 = 5120;
  }
  unsigned int v19 = voucher_name;
  mach_msg_size_t __n = v7;
  uint64_t reply_port = mig_get_reply_port();
  *(void *)&v17.mach_msg_bits_t msgh_bits = 0x2800001513LL;
  *(void *)&v17.msgh_remote_port = __PAIR64__(reply_port, task);
  *(void *)&v17.uint64_t msgh_voucher_port = 0x151C00000000LL;
  int64_t v9 = mach_msg2_internal( &v17,  0x200000003uLL,  (void *)0x2800001513LL,  (void *)__PAIR64__(reply_port, task),  (void *)0x151C00000000LL,  (void *)(reply_port << 32),  (void *)0x1430,  0LL);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(v17.msgh_local_port);
      return v10;
    }

    if (v17.msgh_id == 71)
    {
      uint64_t v10 = -308;
    }

    else if (v17.msgh_id == 5504)
    {
      if ((v17.msgh_bits & 0x80000000) != 0) {
        goto LABEL_26;
      }
      if (v17.msgh_size - 5161 <= 0xFFFFEBFE)
      {
        if (v17.msgh_remote_port) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v19 == 0;
        }
        if (!v12 && v17.msgh_size == 36) {
          uint64_t v10 = v19;
        }
        else {
          uint64_t v10 = -300;
        }
        goto LABEL_27;
      }

      if (v17.msgh_remote_port)
      {
LABEL_26:
        uint64_t v10 = -300;
      }

      else
      {
        uint64_t v10 = v19;
        if (!v19)
        {
          mach_msg_size_t v15 = __n;
          uint64_t v10 = -300;
          if (__n <= 0x1400 && v17.msgh_size - 40 >= __n && v17.msgh_size == ((__n + 3) & 0xFFFFFFFC) + 40)
          {
            size_t v16 = *recipesCnt;
            if (__n <= v16)
            {
              memmove(recipes, __n_4, __n);
              uint64_t v10 = 0;
              *recipesCnt = v15;
            }

            else
            {
              memmove(recipes, __n_4, v16);
              *recipesCnt = v15;
              return -307;
            }

            return v10;
          }
        }
      }
    }

    else
    {
      uint64_t v10 = -301;
    }

void abort(void)
{
  pid_t v0 = getpid();
  __kill(v0, 6);
  _exit(1);
}

void abort_with_reason(void *a1, void *a2, void *a3, unint64_t a4)
{
}

void abort_with_payload_wrapper_internal( void *a1, void *a2, void *a3, void *a4, void *a5, unint64_t a6)
{
  sigset_t v16 = 32;
  sigprocmask(2, &v16, 0LL);
  __abort_with_payload(a1, a2, a3, a4, a5, (void *)a6, v12, v13);
  int v14 = (void *)getpid();
  terminate_with_payload(v14, a1, a2, a3, a4, a5, (void *)(a6 | 0x200), v15);
  __break(1u);
}

void abort_with_payload(void *a1, void *a2, void *a3, void *a4, void *a5, unint64_t a6)
{
}