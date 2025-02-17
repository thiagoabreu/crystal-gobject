require "./object"

module Gst
  class Clock < Object
    @pointer : Void*
    def initialize(pointer : LibGst::Clock*)
      @pointer = pointer.as(Void*)
    end

    def to_unsafe
      @pointer.not_nil!.as(LibGst::Clock*)
    end

    def timeout
      gvalue = GObject::Value.new(GObject::Type::UINT64)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "timeout", gvalue)
      gvalue
    end

    def window_size
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "window_size", gvalue)
      gvalue
    end

    def window_threshold
      gvalue = GObject::Value.new(GObject::Type::INT32)
      LibGObject.object_get_property(@pointer.as(LibGObject::Object*), "window_threshold", gvalue)
      gvalue
    end

    def self.id_compare_func(id1, id2)
      __return_value = LibGst.clock_id_compare_func(id1 ? id1 : nil, id2 ? id2 : nil)
      __return_value
    end

    def self.id_get_clock(id)
      __return_value = LibGst.clock_id_get_clock(id)
      Gst::Clock.new(__return_value) if __return_value
    end

    def self.id_get_time(id)
      __return_value = LibGst.clock_id_get_time(id)
      __return_value
    end

    def self.id_ref(id)
      LibGst.clock_id_ref(id)
      nil
    end

    def self.id_unref(id)
      LibGst.clock_id_unref(id)
      nil
    end

    def self.id_unschedule(id)
      LibGst.clock_id_unschedule(id)
      nil
    end

    def self.id_uses_clock(id, clock)
      __return_value = LibGst.clock_id_uses_clock(id, clock.to_unsafe.as(LibGst::Clock*))
      __return_value
    end

    def self.id_wait(id, jitter)
      __return_value = LibGst.clock_id_wait(id, jitter)
      __return_value
    end

    def self.id_wait_async(id, func, user_data, destroy_data)
      __return_value = LibGst.clock_id_wait_async(id, func, user_data ? user_data : nil, destroy_data)
      __return_value
    end

    def add_observation(slave, master, r_squared)
      __return_value = LibGst.clock_add_observation(@pointer.as(LibGst::Clock*), UInt64.new(slave), UInt64.new(master), r_squared)
      __return_value
    end

    def add_observation_unapplied(slave, master, r_squared, internal, external, rate_num, rate_denom)
      __return_value = LibGst.clock_add_observation_unapplied(@pointer.as(LibGst::Clock*), UInt64.new(slave), UInt64.new(master), r_squared, internal, external, rate_num, rate_denom)
      __return_value
    end

    def adjust_unlocked(internal)
      __return_value = LibGst.clock_adjust_unlocked(@pointer.as(LibGst::Clock*), UInt64.new(internal))
      __return_value
    end

    def adjust_with_calibration(internal_target, cinternal, cexternal, cnum, cdenom)
      __return_value = LibGst.clock_adjust_with_calibration(@pointer.as(LibGst::Clock*), UInt64.new(internal_target), UInt64.new(cinternal), UInt64.new(cexternal), UInt64.new(cnum), UInt64.new(cdenom))
      __return_value
    end

    def calibration(internal, external, rate_num, rate_denom)
      LibGst.clock_get_calibration(@pointer.as(LibGst::Clock*), internal, external, rate_num, rate_denom)
      nil
    end

    def internal_time
      __return_value = LibGst.clock_get_internal_time(@pointer.as(LibGst::Clock*))
      __return_value
    end

    def master
      __return_value = LibGst.clock_get_master(@pointer.as(LibGst::Clock*))
      Gst::Clock.new(__return_value) if __return_value
    end

    def resolution
      __return_value = LibGst.clock_get_resolution(@pointer.as(LibGst::Clock*))
      __return_value
    end

    def time
      __return_value = LibGst.clock_get_time(@pointer.as(LibGst::Clock*))
      __return_value
    end

    def timeout
      __return_value = LibGst.clock_get_timeout(@pointer.as(LibGst::Clock*))
      __return_value
    end

    def synced?
      __return_value = LibGst.clock_is_synced(@pointer.as(LibGst::Clock*))
      __return_value
    end

    def new_periodic_id(start_time, interval)
      LibGst.clock_new_periodic_id(@pointer.as(LibGst::Clock*), UInt64.new(start_time), UInt64.new(interval))
      nil
    end

    def new_single_shot_id(time)
      LibGst.clock_new_single_shot_id(@pointer.as(LibGst::Clock*), UInt64.new(time))
      nil
    end

    def periodic_id_reinit(id, start_time, interval)
      __return_value = LibGst.clock_periodic_id_reinit(@pointer.as(LibGst::Clock*), id, UInt64.new(start_time), UInt64.new(interval))
      __return_value
    end

    def set_calibration(internal, external, rate_num, rate_denom)
      LibGst.clock_set_calibration(@pointer.as(LibGst::Clock*), UInt64.new(internal), UInt64.new(external), UInt64.new(rate_num), UInt64.new(rate_denom))
      nil
    end

    def master=(master)
      __return_value = LibGst.clock_set_master(@pointer.as(LibGst::Clock*), master ? master.to_unsafe.as(LibGst::Clock*) : nil)
      __return_value
    end

    def resolution=(resolution)
      __return_value = LibGst.clock_set_resolution(@pointer.as(LibGst::Clock*), UInt64.new(resolution))
      __return_value
    end

    def synced=(synced)
      LibGst.clock_set_synced(@pointer.as(LibGst::Clock*), synced)
      nil
    end

    def timeout=(timeout)
      LibGst.clock_set_timeout(@pointer.as(LibGst::Clock*), UInt64.new(timeout))
      nil
    end

    def single_shot_id_reinit(id, time)
      __return_value = LibGst.clock_single_shot_id_reinit(@pointer.as(LibGst::Clock*), id, UInt64.new(time))
      __return_value
    end

    def unadjust_unlocked(external)
      __return_value = LibGst.clock_unadjust_unlocked(@pointer.as(LibGst::Clock*), UInt64.new(external))
      __return_value
    end

    def unadjust_with_calibration(external_target, cinternal, cexternal, cnum, cdenom)
      __return_value = LibGst.clock_unadjust_with_calibration(@pointer.as(LibGst::Clock*), UInt64.new(external_target), UInt64.new(cinternal), UInt64.new(cexternal), UInt64.new(cnum), UInt64.new(cdenom))
      __return_value
    end

    def wait_for_sync(timeout)
      __return_value = LibGst.clock_wait_for_sync(@pointer.as(LibGst::Clock*), UInt64.new(timeout))
      __return_value
    end

    alias SyncedSignal = Clock, Bool ->
    def on_synced(&__block : SyncedSignal)
      __callback = ->(_arg0 : LibGst::Clock*, _arg1 : LibGst::Bool*) {
       __return_value = __block.call(Clock.new(_arg0), _arg1)
       __return_value
      }
      connect("synced", __callback)
    end

  end
end

